# Make Commands

## Build the compiler
```
make
```

## Run the compiler
```
./whilec <file>.while
```
## generate dot file as pdf
```
dot -Tpdf dotfiles/cfg.dot -o dotfiles/cfg.pdf
```

## Clean object files and executable
```
make clean
```

## Remove generated output directories
```
rm -rf dotfiles assemblycode
```

## Run dead code elimination
```
make
./whilec dead_test_hard.while
```

