# Chef

## 06 - Roles

### What is a Role?

Officially, a role is “a way to define certain patterns and processes that exist across nodes in an organization as belonging to a single job function”. A simple way to think of this is that a role is a repeatable, named run-list that can also define shared attributes. Say we want to create a group of users on every server and install some universal tools (for instance vim).

Let’s create a few more cookbooks that can be responsible for these things and then create a role called “base” that we can add to each node.

### Creating Additional Cookbooks

We’ll create two more cookbooks:

1. bcf_essentials - Install essential tools like vim.
2. bcf_users - Create users.
3. We’ve named both of these cookbooks with bcf_ because all cookbooks need to be uniquely named and it’s a common practice to prefix custom cookbooks with your company or project name. For this course we’re using bcf_ for “basic chef fluency”, and this prefix will prevent our cookbooks from colliding with any potential third-party cookbooks that we might use.

Let’s create our cookbooks now: