package main

import (
	"errors"
	"flag"
	"fmt"
	"io"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"runtime"
	"strings"
	"time"
)

var (
	appname = flag.String("appname", "vg", "define application name to install.")
	srcdir  = flag.String("src", "$HOME/.local/share", "define application src directory.")
	bindir  = flag.String("bin", "$HOME/.local/bin", "define application src directory.")
	force   = flag.Bool("force", false, "force to install application")
)

func main() {
	flag.Parse()
	if strings.TrimSpace(*appname) == "" {
		panic(errors.New("appname is empty"))
	}
	detectedOS := runtime.GOOS
	switch detectedOS {
	case "linux":
	case "darwin":
	default:
		panic(fmt.Errorf("'%s' does not support Windows OS.", *appname))
	}
	log.Printf("operating system detected: %s - %s", detectedOS, runtime.GOARCH)
	log.Printf("nvim wrapper '%s' will be installed to your system", *appname)
	srcpath := os.ExpandEnv(filepath.Join(*srcdir, *appname))
	binpath := os.ExpandEnv(filepath.Join(*bindir, *appname))
	backup(srcpath)

	binContent := fmt.Sprintf(`
        #!/bin/sh
        export APPNAME=%s
        exec nvim -u "/home/pinocirius/.local/share/%s/init.lua"
    `, *appname, *appname)
	defer log.Printf("binary file '%s' has been created", binpath)
	binfile, err := os.OpenFile(binpath, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0666)
	if err != nil {
		panic(fmt.Errorf("cannot open binfile: %s", err.Error()))
	}
	defer binfile.Close()
	if _, err := binfile.WriteString(binContent); err != nil {
		panic(fmt.Errorf("cannot write application binary content: %s", err.Error()))
	}
	if err := cmd("chmod", "+x", binpath).Run(); err != nil {
		panic(fmt.Errorf("cannot provided executing permission to %s: %s", binpath, err.Error()))
	}
}

func cmd(name string, args ...string) *exec.Cmd {
	var (
		errio io.Writer = os.Stderr
		outio io.Writer = os.Stdout
	)
	c := exec.Command(name, args...)
	if c.Stderr != nil {
		errio = io.MultiWriter(os.Stderr, c.Stderr)
	}
	if c.Stdout != nil {
		outio = io.MultiWriter(os.Stdout, c.Stdout)
	}
	c.Stderr = errio
	c.Stdout = outio
	return c
}

func backup(a string) {
	_, err := os.Stat(a)
	if os.IsNotExist(err) {
		return
	}
	if err != nil {
		panic(err)
	}
	_, dir := filepath.Split(a)
	now := time.Now().Local().Format("2006-01-02_15-04-05")
	bakname := fmt.Sprintf("%s_bak_%s", a, now)
	bakpath := filepath.Join(dir, bakname)
	if err := cmd("mv", a, bakpath).Run(); err != nil {
		panic(fmt.Errorf("cannot backup file: '%s'. Err: %s", a, err.Error()))
	}
}
