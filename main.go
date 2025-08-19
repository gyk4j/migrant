package main

import (
  "path/filepath"
  "flag"
  "fmt"
  "os"
)

func main() {

  initCmd := flag.NewFlagSet("init", flag.ExitOnError)
  upCmd := flag.NewFlagSet("up", flag.ExitOnError)
  sshCmd := flag.NewFlagSet("ssh", flag.ExitOnError)
  reloadCmd := flag.NewFlagSet("reload", flag.ExitOnError)
  haltCmd := flag.NewFlagSet("halt", flag.ExitOnError)
  destroyCmd := flag.NewFlagSet("destroy", flag.ExitOnError)

  if len(os.Args) < 2 {
    fmt.Println("Usage: ", filepath.Base(os.Args[0]), "{init|up|ssh|reload|halt|destroy}")
    os.Exit(1)
  }

  flag.Parse()

  switch os.Args[1] {
  case "init":
    initCmd.Parse(os.Args[2:])
    Init()
  case "up":
    upCmd.Parse(os.Args[2:])
    Up()
  case "ssh":
    sshCmd.Parse(os.Args[2:])
    Ssh()
  case "reload":
    reloadCmd.Parse(os.Args[2:])
    Reload()
  case "halt":
    haltCmd.Parse(os.Args[2:])
    Halt()
  case "destroy":
    destroyCmd.Parse(os.Args[2:])
    Destroy()
  // case "":
  //   Cmd.Parse(os.Args[2:])
  default:
    fmt.Println("Usage: ", filepath.Base(os.Args[0]), "{init|up|ssh|reload|halt|destroy}")
    os.Exit(1)
  }
}

func Init() {
  fmt.Println("init")
}

func Up() {
  fmt.Println("up")
}

func Ssh() {
  fmt.Println("ssh")
}

func Reload() {
  fmt.Println("reload")
}

func Halt() {
  fmt.Println("halt")
}

func Destroy() {
  fmt.Println("destroy")
}
