package main

import (
  "path/filepath"
  "flag"
  "fmt"
  "os"
)

func main() {
  helpCmd := flag.NewFlagSet("help", flag.ExitOnError)
  statusCmd := flag.NewFlagSet("status", flag.ExitOnError)
  globalStatusCmd := flag.NewFlagSet("global-status", flag.ExitOnError)
  versionCmd := flag.NewFlagSet("version", flag.ExitOnError)
  initCmd := flag.NewFlagSet("init", flag.ExitOnError)
  upCmd := flag.NewFlagSet("up", flag.ExitOnError)
  sshCmd := flag.NewFlagSet("ssh", flag.ExitOnError)
  reloadCmd := flag.NewFlagSet("reload", flag.ExitOnError)
  provisionCmd := flag.NewFlagSet("provision", flag.ExitOnError)
  haltCmd := flag.NewFlagSet("halt", flag.ExitOnError)
  destroyCmd := flag.NewFlagSet("destroy", flag.ExitOnError)

  if len(os.Args) < 2 {
    fmt.Println("Usage: ", filepath.Base(os.Args[0]), "{help|status|global-status|version|init|up|ssh|reload|provision|halt|destroy}")
    os.Exit(1)
  }

  flag.Parse()

  switch os.Args[1] {
  case "help":
    helpCmd.Parse(os.Args[2:])
    Help()
  case "status":
    statusCmd.Parse(os.Args[2:])
    Status()
  case "global-status":
    globalStatusCmd.Parse(os.Args[2:])
    GlobalStatus()
  case "version":
    versionCmd.Parse(os.Args[2:])
    Version()
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
  case "provision":
    provisionCmd.Parse(os.Args[2:])
    Provision()
  case "halt":
    haltCmd.Parse(os.Args[2:])
    Halt()
  case "destroy":
    destroyCmd.Parse(os.Args[2:])
    Destroy()
  // case "":
  //   Cmd.Parse(os.Args[2:])
  default:
    fmt.Println("Usage: ", filepath.Base(os.Args[0]), "{help|status|global-status|version|init|up|ssh|reload|provision|halt|destroy}")
    os.Exit(1)
  }
}

func Help() {
  fmt.Println("help")
}

func Status() {
  fmt.Println("status")
}

func GlobalStatus() {
  fmt.Println("global-status")
}

func Version() {
  fmt.Println("version")
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

func Provision() {
  fmt.Println("provision")
}

func Halt() {
  fmt.Println("halt")
}

func Destroy() {
  fmt.Println("destroy")
}
