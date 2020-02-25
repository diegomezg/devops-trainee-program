# Chef

## 12 - Notifications

## All We Need to Know About Ruby Conditionals

Before we look at using conditionals in a recipe we're going to experiment with pure ruby to see how they work. Thankfully Ruby comes with a REPL (Read, Evaluate, Print, Loop) called irb that allows us to type and run individual lines of Ruby to see how the language behaves. To start the REPL we run the irb command:

```
[workstation] chef-repo $ irb
2.4.3-p205 :001 >
After the > we'll be able to write lines of ruby and when we hit enter they will be evaluated right away and we'll be put at a new blank line:

2.4.3-p205 :001 > 1 + 1
 => 2
2.4.3-p205 :002 >
The => 2 indicates that the statement 1 + 1 would return the value 2.
```

To create a conditional in Ruby we'll use the if keyword and some expression that will be evaluated as true or false. On the lines after the expression we will write the code that we want to be evaluated if the expression is true and all of these lines will be evaluated until we come to a line that is an end, else, or elsif ....

Here's an example where the expression directly evaluates to true:

```
2.4.3-p205 :002 > if 1 < 2
2.4.3-p205 :003?>   puts "Yep"
2.4.3-p205 :004?>   end
Yep
 => nil
```
 
The Yep is being printed, but the actual return value is nil this can be really important to know, the last line within the if statement's body. If the expression evaluated to false this is what we would see:

```
2.4.3-p205 :005 > if 1 > 2
2.4.3-p205 :006?>   puts "Yep"
2.4.3-p205 :007?>   end
 => nil
```

Note: Any expression can be used in a conditional and it will be evaluated as to whether it is "truthy" or "falsey". Some values don't work the way that you'd expect. Here's an example where the expression is just an empty string:

```
2.4.3-p205 :008 > if ""
2.4.3-p205 :009?>   puts "Still truthy"
2.4.3-p205 :010?>   end
(irb):10: warning: string literal in condition
Still truthy
 => nil
```

Many conditionals need to handle one case or another, or even more than two cases. Here's an example doing that:

```
2.4.3-p205 :011 > if 1 > 2
2.4.3-p205 :012?>     puts "Greater than 2"
2.4.3-p205 :013?>   elsif 1 >= 1
2.4.3-p205 :014?>     puts "Greater or Equal to 1"
2.4.3-p205 :015?>   else
2.4.3-p205 :016 >     puts "Must be less than 1"
2.4.3-p205 :017?>   end
Greater or Equal to 1
 => nil
```

The first condition evaluates to false so we continue to the elsif expression that evaluated to true so we printed "Greater or Equal to 1". If neither of these expressions had evaluated to true then we would have fallen into the else block and printed "Must be less than 1".

### Changing a Resource Using Conditionals

One of the most common uses we'll find for conditionals is changing what a resource does based on the node itself. A great example of this would be writing a cookbook that installs Apache and is required to work on both Debian and Red Hat based systems. The Apache web server has a different name between these to platforms (apache2 vs httpd).

We've been working with NGINX throughout this course so we're not going to create a cookbook to install Apache, but we will write the hypothetical recipe and resource that we would use to conditionally install Apache using the package resource.

```
package 'apache' do
  if node['platform_family'] == 'debian'
    package_name 'apache2'
  else
    package_name 'httpd'
  end

  action :install
end
```

With this conditional, we would change what the package_name is based on the node's platform_family being debian or not.

### Documentation for this lesson

- Chef's Ruby Style Guide
- Chef's Ruby 'Statements' Sections