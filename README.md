# Frontmatter to JSON Converter Actions #

This is a GitHub Actions that converts the frontmatter YAML in a markdown document to JSON string for further processing.


## Inputs ##

* `markdown` (**Required**): Markdown content containing frontmatter.


## Outputs ##

* `jsonised`: JSON string converted from frontmatter.


## Example Usages ##

### Read Markdown Document to Extract Frontmatter as JSON ###

```yaml
steps:
  - name: Read markdown document containing frontmatter
    id: markdown
    shell: bash
    run: |
      content="---\r\ntitle: lorem ipsum\r\ndescription: hello world\r\nnumber: 2\r\ndate: 2038-12-31T12:34:56\r\n---\r\n\r\n# Heading 1 #\r\n\r\nParagraph 1"
      echo "::set-output name=content::$content"

  - name: Extract frontmatter from markdown as JSON
    id: frontmatter
    uses: aliencube/frontmatter-to-json-actions@v1
    with:
      markdown: '${{ toJSON(steps.markdown.outputs.content) }}'

  - name: Parse JSON
    shell: bash
    run: |
      echo '${{ steps.frontmatter.outputs.jsonised }}' | jq "."
```


## Contribution ##

Your contributions are always welcome! All your work should be done in your forked repository. Once you finish your work with corresponding tests, please send us a pull request onto our `main` branch for review.


## License ##

**Frontmatter to JSON Converter Actions** is released under [MIT License](http://opensource.org/licenses/MIT)

> The MIT License (MIT)
>
> Copyright (c) 2021 [aliencube.org](https://aliencube.org)
> 
> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
