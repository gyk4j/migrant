package command

import (
  "fmt"
  "flag"
  "os"
)

var provisionCmd *flag.FlagSet

func init() {
  provisionCmd = flag.NewFlagSet("provision", flag.ExitOnError)
}

func Provision() {
  fmt.Println("provision")
  provisionCmd.Parse(os.Args[2:])
}