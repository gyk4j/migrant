package command

import (
  "fmt"
  "flag"
  "os"
)

var destroyCmd *flag.FlagSet

func init() {
  destroyCmd = flag.NewFlagSet("destroy", flag.ExitOnError)
}

func Destroy() {
  fmt.Println("destroy")
  destroyCmd.Parse(os.Args[2:])
}
