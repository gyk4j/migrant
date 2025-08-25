package command

import (
  "fmt"
)

type InitCmd struct {
  SubCmd
}

func newInitCmd(name string) (*InitCmd, error) {
  sc, err := newSubCmd(name)
  instance := &InitCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *InitCmd) run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
