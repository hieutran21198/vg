package main

import (
	"errors"
	"flag"
	"fmt"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"runtime"
	"strings"
	"time"
)

var (
	appname   = flag.String("appname", "vg", "define application name to install.")
	srcdir    = flag.String("src", os.ExpandEnv("$HOME/.local/share"), "define application src directory.")
	bindir    = flag.String("bin", os.ExpandEnv("$HOME/.local/bin"), "define application src directory.")
	deepclean = flag.Bool("deepclean", false, "remove all backup file")
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

	createBinaryFile()
}

func backup(a string) {
	_, err := os.Stat(a)
	if os.IsNotExist(err) {
		return
	}
	if err != nil {
		panic(err)
	}
	name, dir := filepath.Split(a)
	now := time.Now().Local()
	bakname := fmt.Sprintf("%s_bak_%s", name, now)
	bakpath := filepath.Join(dir, bakname)
	if err := exec.Command("mv", a, bakpath); err != nil {
		panic(fmt.Errorf("cannot backup file: '%s'", a))
	}
}

func createBinaryFile() {
	binContent := fmt.Sprintf(`
        #!/bin/sh
        export APPNAME=%s
        exec nvim -u "/home/pinocirius/.local/share/%s/init.lua"
    `, *appname, *appname)
	binpath := filepath.Join(*bindir, *appname)
	defer log.Printf("binary file '%s' has been created", binpath)
	binfile, err := os.OpenFile(binpath, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0666)
	if err != nil {
		panic(fmt.Errorf("cannot open binfile: %s", err.Error()))
	}
	defer binfile.Close()
	if _, err := binfile.WriteString(binContent); err != nil {
		panic(fmt.Errorf("cannot write application binary content: %s", err.Error()))
	}
	if err := exec.Command("chmod", "+x", binpath).Run(); err != nil {
		panic(fmt.Errorf("cannot provided executing permission to %s: %s", binpath, err.Error()))
	}
}
