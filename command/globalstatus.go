package command

import (
  "fmt"
  "flag"
  "os"
)

var globalStatusCmd *flag.FlagSet

func init() {
  globalStatusCmd = flag.NewFlagSet("global-status", flag.ExitOnError)
}

func GlobalStatus() {
  fmt.Println("global-status")
  globalStatusCmd.Parse(os.Args[2:])
}