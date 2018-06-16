//////////////////////////////////////
// File Name: chknum.c
//////////////////////////////////////
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>

int chkNum( char *s, int *rc )
{

#define FALSE (0)
#define TRUE  (1)
  
  int fnd_dlr = FALSE;
  int fnd_sign = FALSE;
  int fnd_digit = FALSE;
  int fnd_dec = FALSE;
  int fnd_nonbk = FALSE;
  int fnd_suffix = FALSE;
  int fnd_prefix = FALSE;
  int lsfx, lpfx, lval = 0;
  char suffix[30], prefix[30], value[30];
  char suffix2[30], prefix2[30], value2[30];
  int i = 0;
  int j = 0;
  int ll, rr = 0;
  int ls = strlen(s);
  char s2[30];
  int last_digit = 0;
  int first_digit = 0;

  s2[0] = '\0';
  *rc = 0;

// exit if null string
  if (ls == 0)
    return( *rc = 0 );

// scan for leading blanks
  for (i = 0; 
       i <= (ls - 1);
       i++) 
      if (!isspace(s[i])) {
        fnd_nonbk = TRUE;
        break;
      }
  ll = i;

// exit if string all blank
  if (!fnd_nonbk)
    return( *rc = 0 );

// scan for trailing blanks
  for (i = ls - 1; 
       i > ll;
       i--) 
      if (!isspace(s[i]))
        break;
  rr = i;

// copy trimmed string to s2, reset string length
   for ( i = ll, j=0; i <= rr; i++, j++)
    s2[j] = s[i];
    s2[j] = '\0';
   ls = strlen(s2);

// set flag if digit found
  if ( strcspn(s2, "0123456789.,/") != ls )
     fnd_digit = TRUE;

//forward scan for prefix if digit found in string
  if (fnd_digit) {
    for (i = 0; i <= ls - 1; i++) {
      if ( isdigit( s2[i] ) || s2[i] == ',' || s2[i] == '.' ) {
        first_digit = i+1;
        break;      
      }
    }
    if (first_digit != 1) {
      fnd_prefix = TRUE;
      lpfx = first_digit - 1;
    }
  }
  
//backward scan for suffix if digit found in string
  if (fnd_digit) {
    for (i = (ls - 1); i >= 0 && ls != 0; i--) {
      if ( isdigit( s2[i] ) || s2[i] == ',' || s2[i] == '.' ) {
        last_digit = i+1;
        break;      
      }
    }
    if (last_digit != ls) {
      fnd_suffix = TRUE;
      lsfx = ls - last_digit;
    }
  }

// isolate prefix
   if ( fnd_prefix ) {
     for ( i = 0, j=0; i < lpfx; i++, j++)
       prefix[j] = s2[i];  
       prefix[j] = '\0';
     for ( i = 0, j = 0; i < lpfx; i++)
       if ( prefix[i] != ' ' && prefix[i] != '/' ) {
         prefix2[j] = prefix[i];  
         j++;
       }
       prefix2[j] = '\0';
     lpfx = strlen( prefix2 ); 
   }

// isolate value
   if ( fnd_digit ) {
     for ( i = first_digit-1, j=0; i < last_digit; i++, j++)
       value[j] = s2[i];  
     value[j] = '\0';
     lval = strlen( value );
     for ( i = 0, j = 0; i < lval; i++)
       if ( value[i] != ',' && value[i] != '/' ) {
         value2[j] = value[i];  
         j++;
       }
     value2[j] = '\0';
     lval = strlen( value2 );
   }

// isolate suffix
   if ( fnd_suffix ) {
     for ( i = last_digit, j = 0; i < last_digit + lsfx; i++, j++ )
       suffix[j] = s2[i];
     suffix[j] = '\0';
     for ( i = 0, j = 0; i < lsfx; i++)
       if ( suffix[i] != ' ' && suffix[i] != '/' ) {
         suffix2[j] = suffix[i];  
         j++;
       }
     suffix2[j] = '\0';
     lsfx = strlen( suffix2 );
   }
 
//
// apply rules
//

// validate string w/o any digits 
// (i.e. no prefix or suffix)

   if ( !fnd_digit ) {
     for ( i = 0; i < ls; i++ )
       switch ( s2[i] )
       {
         case '$':
           if ( fnd_dlr )
             *rc = 1;
           else 
             fnd_dlr = TRUE;
           break;
         case '+':
         case '-':
           if ( fnd_sign )
             *rc = 1;
           else 
             fnd_sign = TRUE;
           break;
         case '.':
           if ( fnd_dec )
              *rc = 1;
           else 
             fnd_dec = TRUE;
           break;
         case ',':
         case '/':
         case ' ':
           break;
         default:
           *rc = 1;   
       }

     return ( *rc ) ;
   }

// validate prefix
   if ( fnd_prefix ) {
     for ( i = 0; i < lpfx; i++ )
       switch ( prefix2[i] )
       {
         case '$':
           if ( fnd_dlr )
             *rc = 1;
           else 
             fnd_dlr = TRUE;
           break;
         case '+':
         case '-':
           if ( fnd_sign )
             *rc = 1;
           else 
             fnd_sign = TRUE;
           break;
         default:
             *rc = 1;
       }
     if ( *rc != 0 )
       return (*rc) ;
   }

// validate suffix
   if ( fnd_suffix ) {
     for ( i = 0; i < lsfx; i++ )
       switch ( suffix2[i] )
       {
         case '$':
           if ( fnd_dlr )
             *rc = 1;
           else 
             fnd_dlr = TRUE;
           break;
         case '+':
         case '-':
           if ( fnd_sign )
             *rc = 1;
           else 
             fnd_sign = TRUE;
           break;
         default:
             *rc = 1;
       }
     if ( *rc != 0 )
       return ( *rc ) ;
   }

// validate value
   if ( fnd_digit ) {
     for ( i = 0; i < lval; i++ ) {
       if ( value2[i] == '-' && ( fnd_sign || fnd_dlr ) )
         *rc = 1;
       if ( value2[i] == '.' ) {
         if ( fnd_dec )
           *rc = 1;
         else
           fnd_dec = TRUE;
       }
       if ( strstr( value2, "-." ) || strstr( value2, ".-" ) )
         *rc = 1;
       if ( !isdigit( value2[i] ) && value2[i] != '.' && value2[i] != '-' )
         *rc = 1;
     }
   }

  return ( *rc );
}
