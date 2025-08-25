package command

import (
  "fmt"
)

type HelpCmd struct {
  SubCmd
}

func NewHelpCmd(name string) (*HelpCmd, error) {
  sc, err := newSubCmd(name)
  instance := &HelpCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *HelpCmd) Run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
