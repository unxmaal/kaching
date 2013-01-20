#!/bin/bash

wget -q -O output "http://m.macys.com/search/index.ognc?SearchTarget=*&cm_sp=navigation-_-top_nav-_-search&Keyword=590445&KEYWORD_GO_BUTTON.x=0&KEYWORD_GO_BUTTON.y=0"


if grep -Fxq productThumbSale output
then
        price=`grep productThumbSale output | awk -F "</span>|<span" {'print $6'} | awk -F "$" {'print $2'} | awk -F "." {'print $1'}`

        echo "price is $price"
        if [ "$price" -lt "300" ]; then
                echo "score!"
                mail -s "Earrings are $price today!" eric.e.dodd@gmail.com < msg
        fi
fi

exit 0
