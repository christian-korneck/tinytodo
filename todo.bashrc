#!/bin/bash
# a simple cmdline todo list (requires recutils: brew install recutils)
TODOLIST=$HOME/todo.rec
alias lstodos='recsel -C -t Todo -R Id,Content "$TODOLIST"'
alias lstodo='lstodos'
function mktodo() { recins -t Todo -f Content -v "$1" "$TODOLIST"; }
function rmtodo() { recdel -t Todo -e "Id = $1" "$TODOLIST"; }
function bootstraptodo()
{
  if [ ! -f "$TODOLIST" ]; then
    cat >"$TODOLIST" <<EOF
%rec: Todo
%key: Id
%auto: Id
%sort: Id
%mandatory: Id Content
EOF
fi
}
