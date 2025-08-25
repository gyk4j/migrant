package command

import (
  "fmt"
)

type GlobalStatusCmd struct {
  SubCmd
}

func newGlobalStatusCmd(name string) (*GlobalStatusCmd, error) {
  sc, err := newSubCmd(name)
  instance := &GlobalStatusCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *GlobalStatusCmd) run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
