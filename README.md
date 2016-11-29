# Cloud computing with OpenStack

An introduction

## How to use

Simple: just
[fork this repo](https://github.com/fghaas/openstack-intro/fork)
and drop Markdown files into `markdown` and images into
`images`. Then, fix up `index.html` to include your Markdown-authored
sections.

This repo has two branches, one named `master` and one
`gh-pages`. Make sure you do your regular work in `master`, then merge
into `gh-pages` and push both branches. Your presentation will then be
rendered to [GitHub Pages](https://pages.github.com/) at a URL of the
form:

- http://*username*.github.io/*presentation-repo-name*

You can share the URL immediately, and GitHub will host it for you,
indefinitely, for free.

### Theming

The theme is defined in `css/reveal-override.scss` using
[Sass](http://sass-lang.com/); if you update this, you will need to
re-compile into `css/reveal-override.css` via:

    $ sass css/reveal-override.scss css/reveal-override.css -t expanded

If you are doing continual development on the file, then run this in
the background to automatically re-compile every time the `.scss` file
is changed:

    $ sass --watch css:css -t expanded

If you are using GitHub Pages, make sure that the latest versions of
the generated `.css` files are committed and pushed to the remote
`gh-pages` branch.

### Running things locally

If you want to run your slides locally, rather than on GitHub Pages,
just drop them into the `DocumentRoot` of a web server, like Apache or
[`lighttpd`](https://www.lighttpd.net/).

For `lighttpd`, you may also want to set the following options:

```
dir-listing.encoding = "utf-8"
server.dir-listing   = "enable"
server.modules      += ( "mod_userdir" )
userdir.path         = "public_html"
```

Use the provided `.gitmodules` file to automatically clone local
copies of `reveal.js`,
[`qrcodejs`](https://davidshimjs.github.io/qrcodejs/), and
[`reveal.js-menu`](https://github.com/denehyg/reveal.js-menu):

```bash
git submodule init
git submodule update
```

Then, create a symlink to your Git checkout in `~/public_html`, such as:

```bash
ln -s ~/git/my-presentation ~/public_html/
```

... and access your presentation from
http://localhost/~yourusername/my-presentation/


## Do you find this helpful?

If you find the content in this repo useful, it would be great if you
could let me know. You could either star this repo, or even better,
send me a [happiness packet](https://www.happinesspackets.io).
