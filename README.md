# links

## Introduction

[links](https://github.com/thesp0nge/links) is a tool for checking an URL for
availability by trying to access it and grabbing the HTTP return code.

The idea came to me during a penetration test since I had a bulk list of URLs
to check for availability and I wanted to automate this process.

## Installing links

Installing links is easy. You can always obtain the latest stable code by using the following command: 

``` 
gem install links
```

If you want to install a _pre_ release, such as a _release candidate_ you can do it this way:
```
gem install links --pre
```

## Using links

After you installed links gem, you have the links command you can use this way:

```
links http://www.some.org/somepage.html
```

## Contributing to links
 
* Check out the latest master to make sure the feature hasn't been implemented
  or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it
  and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to
  have your own version, or is otherwise necessary, that is fine, but please
  isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2010-2012 Paolo Perego, <thesp0nge@gmail.com>. See LICENSE for
further details.

