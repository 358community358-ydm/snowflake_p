{% macro clean_string(column_name) %}
    INITCAP(NULLIF(TRIM({{ column_name }}),''))
{% endmacro %}