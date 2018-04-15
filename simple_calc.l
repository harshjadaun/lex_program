%option noyywrap
%{
 #include<stdio.h>
 float a,f,answer;
 char c;
%}
digits [0-9]+
op "+"|"-"|"*"|"/"

%%
{digits} {         
                   a=atof(yytext);
		   if(f==0){
			answer=a;
			f=1;
		   }
		   else{
			switch(c){
				case '+':answer=answer+a;break;
				case '-':answer=answer-a;break;
				case '*':answer=answer*a;break;
				case '/':answer=answer/a;break;
			}
		   }	
         }
{op} {
	if(strcmp(yytext,"+")==0)
		c='+';
	if(strcmp(yytext,"-")==0)
		c='-';
	if(strcmp(yytext,"*")==0)
		c='*';
	if(strcmp(yytext,"/")==0)
		c='/';

     }
. { printf("Answer is %f",answer); }

%%
void main(){
 f=answer=0;
 printf("Enter the string\n");
 yylex();
}

