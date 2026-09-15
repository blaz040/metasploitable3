:: Needs to update certs because the OS wont update itself this is needed and 
:: not a security risk
cmd /c certutil -addstore -f "Root" E:\addtrust_external_ca.cer
cmd /c certutil -addstore -f "Root" E:\baltimore_ca.cer
cmd /c certutil -addstore -f "Root" E:\digicert.cer
cmd /c certutil -addstore -f "Root" E:\equifax.cer
cmd /c certutil -addstore -f "Root" E:\globalsign.cer
cmd /c certutil -addstore -f "Root" E:\gte_cybertrust.cer
cmd /c certutil -addstore -f "Root" E:\microsoft_root_2011.cer
cmd /c certutil -addstore -f "Root" E:\thawte_primary_root.cer
cmd /c certutil -addstore -f "Root" E:\utn-userfirst.cer