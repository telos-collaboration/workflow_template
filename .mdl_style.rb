# mdl rules https://github.com/markdownlint/markdownlint/blob/master/docs/RULES.md

# Import all default rules
all

# Only allow atx style headings (e.g. # H1 ## H2)
rule 'MD003', :style => :atx

# Only allow dashes in unordered lists
rule 'MD004', :style => :dash

# Do not enforce line length on code blocks
rule 'MD013', :code_blocks => false

# Lists should be numbered sequentially in text
rule 'MD029', :style => :ordered

# Ignore blockquotes separated only be a blank line. This is a limitation of
# some markdown parsers, not markdown itself.
exclude_rule 'MD028'

# Allow bare URLs (i.e. without angle brackets)
exclude_rule 'MD034'

# Allow multiple top level headings
# (since we want the README to have a full Markdown document within it)
exclude_rule 'MD025'
