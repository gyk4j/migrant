package command

import (
  "fmt"
)

type UpCmd struct {
  SubCmd
}

func newUpCmd(name string) (*UpCmd, error) {
  sc, err := newSubCmd(name)
  instance := &UpCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *UpCmd) run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
