# Python provides several built-in data structures for organizing and storing data. Each has distinct characteristics suited for different use cases:

# List
Definition: An ordered, mutable collection of items.
Syntax: Enclosed in square brackets [].
Mutability: Mutable (elements can be added, removed, or modified after creation).
Order: Maintains the insertion order of elements.
Duplicates: Allows duplicate elements.
Indexing: Elements are accessed by their numerical index.

# Tuple
Definition: An ordered, immutable collection of items.
Syntax: Enclosed in parentheses ().
Mutability: Immutable (elements cannot be changed after creation).
Order: Maintains the insertion order of elements.
Duplicates: Allows duplicate elements.
Indexing: Elements are accessed by their numerical index.

# Set
Definition: An unordered, mutable collection of unique items.
Syntax: Enclosed in curly braces {} (or set() for an empty set).
Mutability: Mutable (elements can be added or removed, but the elements themselves must be immutable).
Order: Does not guarantee any specific order of elements.
Duplicates: Does not allow duplicate elements; only unique elements are stored.
Indexing: Elements are not accessed by index due to the unordered nature.

# Dictionary
Definition: An unordered (in older Python versions), mutable collection of key-value pairs.
Syntax: Enclosed in curly braces {} with key-value pairs separated by colons :.
Mutability: Mutable (values can be changed, and key-value pairs can be added or removed). Keys must be immutable, but values can be of any type.
Order: Insertion order is preserved in Python 3.7+; in older versions, it was unordered.
Duplicates: Keys must be unique; values can be duplicated.
Indexing: Values are accessed by their unique keys.


# Summary of Differences

List: Your go-to for a general-purpose, dynamic sequence of items where order and modification are important. They are like dynamically sized arrays.

Tuple: Used for fixed collections of items that should not change after creation, such as coordinates or database records. Their immutability also makes them slightly faster than lists and allows them to be used as dictionary keys.

Set: Ideal when you need to store unique elements and perform fast membership tests or mathematical set operations (union, intersection, etc.). They do not support indexing because they are unordered.

Dictionary: Used to store data as key-value pairs, which allows for very fast lookups and retrieval by an identifier (key). They are perfect for structured data like user profiles or configuration settings

# Feature 	 List	    Tuple	    Set	                         Dictionary
Syntax	      []	    ()	        {} (or set())	             {} with key: value pairs
Mutability	  Mutable 	Immutable 	Mutable 	                 Mutable 
                                    (can add/remove elements)   (can change values  -                            keys are immutable)
Order	     Ordered 	Ordered 	Unordered       	        Ordered( 3.7+) 
Duplicates	 Allows   	Allows 	    Does not allow 	             values can be  -     --                                                              duplicate 