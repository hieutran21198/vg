package main

import (
	"bytes"
	"errors"
	"flag"
	"fmt"
	"log"
	"runtime"
	"strings"
)

type Config struct {
    SrcDir string
    BinDir string
}

var(
    appname = flag.String("appname", "vg", "define application name to install.")
    conf = &Config{}
)


func main() {
    flag.Parse()
    if strings.TrimSpace(*appname) == "" {
        panic(errors.New("appname is empty"))
    }
    os := runtime.GOOS
    switch os {
    case "linux":
    case "darwin":
    default:
        panic(fmt.Errorf("'%s' does not support Windows OS.", *appname))
    }
    log.Printf("operating system detected: %s - %s",os, runtime.GOARCH)
    log.Printf("nvim wrapper '%s' will be installed to your system", *appname)

    makeBinary(*appname)
}

func makeBinary(appname string) {
    binContent := fmt.Sprintf(`
        #!/bin/sh
        export APPNAME=%s
        exec nvim -u "/home/pinocirius/.local/share/%s/init.lua"
    `, appname, appname)
    b := &bytes.Buffer{}
    if _, err := b.WriteString(binContent); err != nil {
        panic(fmt.Errorf("cannot write application binary content: %s", err.Error()))
    }
}
