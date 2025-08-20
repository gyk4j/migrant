package command

import (
  "fmt"
  "flag"
  "os"
)

var sshCmd *flag.FlagSet

func init() {
  sshCmd = flag.NewFlagSet("ssh", flag.ExitOnError)
}

func Ssh() {
  fmt.Println("ssh")
  sshCmd.Parse(os.Args[2:])
}