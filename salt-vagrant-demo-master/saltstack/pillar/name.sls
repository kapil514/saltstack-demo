{# {% if grains.id == 'minion1' %} #}
{# name: minion1 world #}
{# {% elif grains.id == 'minion2' %}#}
{# name: minon2 world #}
{# {% endif %} #}

{% set lookup = {
  'minion1': "Minon1's world",
  'minion2' : "Minons2's world",
}%}
{% set name = lookup[grains.id] %}

name: {{ name  }}
