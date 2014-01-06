# Tinge

Extract color information from CSS/SCSS files (for various formats).

## Usage

You can see usage information by running `tinge help`.

Currently the only available operation is extracting color variable
assignments from SCSS files and outputting them to various formats:

 * ASE (Adobe Swatch Exchange)
 * SCSS (but with all variable assignments and functions resolved)
 * JSON
 * Ruby
 * YAML

This command is executed as `tinge vars`, although since it's the
default, `vars` can be omitted (as is in the examples below):

As an example, using this simple SCSS file:

```
$ cat colors.scss
$white: white;
$gray: darken($white, 85%);
$orange: #fab444;
```

We can get the final (resolved) SCSS:

```
$ tinge colors.scss
$gray: #262626;
$orange: #fab444;
$white: #ffffff;
```

Convert it to a JSON object suitable for use in JavaScript:

```
$ tinge -f json colors.scss
{"white":"#ffffff","gray":"#262626","orange":"#fab444"}
```

Output it as YAML (and note `tinge` accepts stdin, too):

```
cat colors.scss | tinge -f yml
---
gray: "#262626"
orange: "#fab444"
white: "#ffffff"
```

We can also create an ASE file (note `--output`/`-o` is required):

```
tinge -f ase colors.scss -o colors.ase
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/tinge/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
