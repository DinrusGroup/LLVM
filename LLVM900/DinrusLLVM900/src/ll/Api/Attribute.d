module ll.api.Attribute;

import ll.c.Types;

alias Атрибут[] Атрибуты;

    public  class Атрибут
    {
        private  ЛЛАтрибут экземпл;

        this(ЛЛАтрибут атрибутРеф)
        {
            this.экземпл = атрибутРеф;
        }

        public ЛЛАтрибут раскрой(){return this.экземпл;}
    }

