if [[ ! -z "${PUBLIC_DOMAIN_NAME}" ]]; then
    if [[ ${NGINX_PUBLIC_PORT} != "" && ${NGINX_PUBLIC_PORT} != "80" ]]; then
        PUBLIC_PORT=":${NGINX_PUBLIC_PORT}"
    else
        PUBLIC_PORT=""
    fi
    # SERVER CONFIGURATION
    export ENKETO_URL="${PUBLIC_REQUEST_SCHEME}://${ENKETO_EXPRESS_PUBLIC_SUBDOMAIN}.${PUBLIC_DOMAIN_NAME}${PUBLIC_PORT}"
    export ENKETO_INTERNAL_URL="http://${ENKETO_EXPRESS_PUBLIC_SUBDOMAIN}.${INTERNAL_DOMAIN_NAME}" # Always use HTTP internally.
    export KOBOCAT_URL="${PUBLIC_REQUEST_SCHEME}://${KOBOCAT_PUBLIC_SUBDOMAIN}.${PUBLIC_DOMAIN_NAME}${PUBLIC_PORT}"
    export KOBOCAT_INTERNAL_URL="http://${KOBOCAT_PUBLIC_SUBDOMAIN}.${INTERNAL_DOMAIN_NAME}" # Always use HTTP internally.
    export CSRF_COOKIE_DOMAIN=".${PUBLIC_DOMAIN_NAME}"
    export DJANGO_ALLOWED_HOSTS=".${PUBLIC_DOMAIN_NAME} .${INTERNAL_DOMAIN_NAME}"

    # DATABASE
    export DATABASE_URL="${KPI_DATABASE_URL}"
    export POSTGRES_DB="${KPI_POSTGRES_DB}"

    # OTHER
    export DJANGO_DEBUG="${KPI_DJANGO_DEBUG}"
    export RAVEN_DSN="${KPI_RAVEN_DSN}"
    export RAVEN_JS_DSN="${KPI_RAVEN_JS_DSN}"

else
    echo 'Please fill out your `envfile`!'
    exit 1
fi
