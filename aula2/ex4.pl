factorial(0,1).
factorial(1,1).
factorial(N,Valor):-
    N > 1,
    N1 is N - 1,
    factorial(N1,Valor2),
    Valor is Valor2 * N.

fibonacci(0,1).
fibonacci(1,1).
fibonacci(N,Val):-
    N > 1,
    N1 is N - 1, fibonacci(N1,Val1),
    N2 is N - 2, fibonacci(N2,Val2),
    Val is Val1 + Val2.