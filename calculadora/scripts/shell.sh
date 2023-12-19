
echo "Mandando e-mail com mail do linux" | mail -s "a subject" $1


# Configurações do servidor SMTP
SMTP_SERVER="smtp.gmail.com"
SMTP_PORT="587"
SMTP_USERNAME="pedrodaluzmota208@gmail.com"
SMTP_PASSWORD="fpqi qgxq cdvb cbmi"

# Destinatário e remetente
EMAIL="pedrodaluzmota208@gmail.com"

# Criar corpo do e-mail
ASSUNTO="O app foi contruido"
CORPO="Notificação"

# Enviar e-mail usando o comando mail
#echo -e "$CORPO" | mail -s "$ASSUNTO" -a "From: $EMAIL" -s smtp="smtp://$SMTP_SERVER:$SMTP_PORT" -s smtp-use-starttls -s smtp-auth=login -s smtp-auth-user="$SMTP_USERNAME" -s smtp-auth-password="$SMTP_PASSWORD" "$EMAIL"
echo "Corpo do e-mail" | mailx -s "Assunto do E-mail" -s smtp=smtp://smtp.gmail.com:587 -s smtp-use-starttls -s smtp-auth=$1 -s smtp-auth-user=$1 -s smtp-auth-password=fpqi qgxq cdvb cbmi $1
#echo "Corpo do e-mail" | mailx -s "Assunto do E-mail" -s smtp=smtp://smtp.example.com:587 -s smtp-use-starttls -s smtp-auth=$1 -s smtp-auth-user=$1 -s smtp-auth-password="fpqi qgxq cdvb cbmi" $1
