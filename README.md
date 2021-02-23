# Численные методы решения уравнений математической физики
## Структура
* Лабораторные работы лежат в директориях с соответсвующим им номером
* Срипты лежат в директориях `scripts`, функции в `functions`
## Работа с репозиторием
Так как каждый работает со своей лабораторной и они лежат в разных директориях, мешать никто никому не должен, поэтому клонируем себе `master`, работаем в нем, пушим в него же.
## По выполнении очередной лабораторной работы
По возможности оставлять `README.md` в директории с каждой выполенной лабораторной с  короткими комментариями по тому, что происходит в каждом файле, чтобы вам не спамили в личку с просьбами разъяснить что к чему.

**Например:** 
* `functions/f2.m` - рассматриваемая функция, заданная в условии
* `functions/runge_kutta.m` - реализация решения задачи Коши с помощью явной схемы Рунге-Кутта второго порядка типа предиктор-корректор, задаваемой матрицей Бутчера `A` и векторами `a` и `b` (см. сминар 2)
