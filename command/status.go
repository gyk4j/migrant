package command

import (
  "fmt"
  "flag"
  "os"
)

var statusCmd *flag.FlagSet

func init() {
  statusCmd = flag.NewFlagSet("status", flag.ExitOnError)
}

func Status() {
  fmt.Println("status")
  statusCmd.Parse(os.Args[2:])
}