# InnerSource Commons

This repo primarily serves to host the pages for InnerSource Commons. The master branch holds the source and the gh-pages branch holds the [Jekyll](https://jekyllrb.com/) rendered output.

## Contributing

TODO: Add contributing guidelines.

* Ensure that [img tags have alt attributes populated](http://webaim.org/techniques/alttext/) (for accessibility)
* The main page's left hand side sidebar is edited at \_includes/\_sidebar.html
* The navigational links at the top of the pages are at \_data/\_navigation.yml
* Event pages are under *events*; other main pages are under *pages*

## git command line tips

* Do this once when you've checked out your fork of the main ISC repo: git remote add upstream https://github.com/paypal/InnerSourceCommons.git
* Do this to rebase the fork with the main ISC repo: 
    - git fetch upstream
    - git checkout master
    - git rebase upstream/master
* Make your changes and test/check them
* Push them to your fork
    - git add &lt;files&gt;
    - git commit -m "comment" &lt;files&gt;
    - git push origin master
* At this point, I usually go to the github web page for my fork to create the PR

## Build process:

* Install ruby
* Install bundler gem
* Run 'bundle install'
* Run 'jekyll build -s &lt;master branch location&gt; -d &lt;gh-pages location&gt;'
    - *Note that most of the local links refer to /InnerSourceCommons, so you probably want to direct the gh-pages location to a directory that ends in /InnerSourceCommons*
* Copy README.md from &lt;master branch location&gt; to &lt;gh-pages location&gt;
