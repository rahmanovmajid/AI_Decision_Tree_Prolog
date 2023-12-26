# Fahmin Guliyev - 26.11.2020

tree(if_then_else('Is religion too important for him?',
    if_then_else('Does he live in staying facility provided by company?',
        if_then_else('Is he making lots of visits to his family (parents) house?',
            if_then_else('Does he use Azeri to communicate inside the company?',
                employee(turkish),
                employee(kyrgyz)),
            employee(malaysian)),
                if_then_else('Does he live in the same city as his working place?',
                    employee(azerbaijani),
                    false)),
    if_then_else('Is he likely to argue about rudeness / character?',
        if_then_else('Is he having time zone difficulties (e.g. cannot make frequent videocalls with family',
            employee(american),
            false),
        if_then_else('Does he love or enjoy speaking English?',
            employee(russian),
            employee(french)
            )))).



employee(E):-
    tree(T),
    tree_employee(T,E).

tree_employee(employee(E),E).

tree_employee(if_then_else(Cond,Then,Else),E) :-
    ( is_true(Cond) ->
         tree_employee(Then, E)
        ; tree_employee(Else, E)
        ).

is_true(Q) :-
    format("~w?\n", [Q]),
    read(yes).
