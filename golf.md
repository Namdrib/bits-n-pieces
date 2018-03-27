# Golfing code
## c/c++

use | instead of | saves | comments
--- | ---------- | ----- | --------
`#define` things | things used often | |
ternary `z=(x<c)?x:c;` | if/else statements | variable |
`for(;;)` | `while(1)` | 1 |
`while(n--)` | `for (int i=0;i<n;i++)` | variable | ONLY if need to loop n times once
`#import<lib>` | `#include<lib>` | 1 |
`#import<bits/stdc++.h>` | including things | a lot, potentially | includes literally everything
| `int a,b,c,d;` | `int a,b,c,d; a=b=c=d=0;` | variable | declare global vars to auto-set them to zero. e.g. `int a,b,c,d; // all zero`
`main()` | `int main()` | 4 | sometimes. compilers vary
|  | `return 0;` | 9 | implicit in c++
`(x*y)` | `(x!=0&&y!=0)` | 7 |
`if(a^b)` | `if(a!=b)` | 1 |
`if(n&1)` | `if(n%2==1)` | 3 | checking parity (returns true for odd). Used `if(!(n&1))` for even
`using namespace std;` | `std::...` | depends | requires at least 5 `std::` to be viable
`if(1)this,that,other;` | `if(1){this;that;them;goats;}` | 2 | only statements (?)
`a1e9` | `a1000000000` | n |
`f(a,b,c)` | `f(int a,int b,int c)` | variable | must all be the same type
`main(c,v)char**v)` | `main(int c,char**v)` | 2 |
`a=b=c=0` | `a=0;b=0;c=0;` | variable | "chained assignment"
`cout << "a\n";` | `cout << "a" << endl;` | 4 | saves a potential `std::` from endl, too
`1<<n` | `pow(2,n)` | 4 | raise 2 to the power of n
