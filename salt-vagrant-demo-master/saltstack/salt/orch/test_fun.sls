call_execution_function:
  salt.function:
    - tgt: '*'
    - name: cmd.run
    - arg:
      - date 
