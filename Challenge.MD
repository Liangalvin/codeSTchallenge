Little Bob loves chocolates, and goes to the store with cash in his pocket. The price of
each chocolate is price. The store offers a discount: for every 'wrappers needed' number of wrappers
he gives the store, he’ll get one chocolate for free.

The free chocolate program has been successful, and they've decided to tweak the promotion.

Chocolate Types
---------------
The store is now pushing certain types of chocolates. There are
four types, white, dark, milk and sugar free and the store
is giving away an extra sample of chocolates in addition to the original wrapper promotion.
For the original wrapper promotion, the free chocolates will be of the same
type that you are buying for that purchase. Note that if Bob accumulates enough wrappers of the other type,
he can trade those in as well.

- If you trade in wrappers for milk or white, you get an extra sugar free chocolate along with
every free milk or white chocolate that you would normally get.
- If you trade in wrappers for sugar free chocolate, you get an extra dark chocolate along
with every free sugar free chocolate that you get.
- Since dark is all the rage, that is considered premium and there is no additional candy bonus.

The code test itself:
---------------

We have given you four orders in the input/orders.txt file and we expect your program to read those orders and generate output matching output/output.txt.

Explanation of the numbers in the output file:

1. He buys 6 milk chocolates and trades in 5 wrappers to get 1 free milk chocolate. He also gets one sugar free.
2. He buys 3 dark chocolates, but since wrappers needed is 4 he can't trade any wrappers in to get anything free.
3. He can buy 3 sugar_free chocolates for $6. Now he can give 2 of this 3 wrappers and get 1 sugar_free
chocolate. Again, he can use his 1 unused wrapper and 1 wrapper of new chocolate to get one more chocolate.
Total is 5 sugar free. Since he got 2 bonus sugar_free chocolates, he also gets 2 bonus dark chocolates.
And since he got 2 dark chocolates, he can trade both of those in for an extra dark.
4. He buys 3 white and trades in 2 white wrappers for 1 white and 1 sugar free. Now he can use the extra white wrapper to get another white and another sugar free. Those 2 sugar free wrappers get another sugar free and a dark.
