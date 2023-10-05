with Laboratorio06, Ada.Text_IO, Ada.Integer_Text_IO;
use Laboratorio06, Ada.Text_IO, Ada.Integer_Text_IO;
with Ada.Strings.Fixed, Ada.Strings;
use Ada.Strings.Fixed, Ada.Strings;
procedure Lab06_Pruebas is
   V                   : T_Vector10;
   par, posicion       : Natural;
   num                 : Positive;
   impares             : Natural;
   Sin_Cifrar, Cifrado : String (1 .. 10);
   Texto               : String := "HOLAMUNDO";
   Num2                : String (1 .. 10);
   V2                  : T_Vector16;
   text                : String (1 .. 80);
   c                   : Natural;
   IBAN                : String (1 .. 29);
begin
   -- Aportaci�n an�nima de un alumno generoso
   -- No se garantiza la total correcci�n de las mismas

   ----------------
   -- Ultimo_Par --
   ----------------

   Put_Line ("Ultimo par de (1 3 5 7 9 11 13 15 17 19) es 0 pos 0");
   V := (1, 3, 5, 7, 9, 11, 13, 15, 17, 19);
   Ultimo_Par (V, Par, Posicion);
   Put (par);
   Put (posicion);
   New_Line;

   Put_Line ("Ultimo par de (8 4 6 7 5 3 2 1 1 9) es 2 pos 7");
   V := (8, 4, 6, 7, 5, 3, 2, 1, 1, 9);
   Ultimo_Par (V, Par, Posicion);
   Put (par);
   Put (posicion);
   New_Line;

   Put_Line ("Ultimo par de (0 2 4 6 8 8 6 2 0) es 0 pos 10");
   V := (0, 2, 4, 6, 8, 8, 6, 4, 2, 0);
   Ultimo_Par (V, Par, Posicion);
   Put (par);
   Put (posicion);
   New_Line;

   Put_Line
     ("Ultimo par de (23 534 29 0 329 3267 3985 982 238 999) es 238 pos 9");
   V := (23, 534, 29, 0, 329, 3_267, 3_985, 982, 238, 999);
   Ultimo_Par (V, Par, Posicion);
   Put (par);
   Put (posicion);
   New_Line;

   Put_Line ("Ultimo par de (0 0 0 0 0 0 0 0 0 0) es 0 pos 10");
   V := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
   Ultimo_Par (V, Par, Posicion);
   Put (par);
   Put (posicion);
   New_Line;

   --------------------------
   -- multiplos_del_ultimo --
   --------------------------

   New_Line (3);

   V := (2, 5, 25, 9, 35, 60, 29, -55, 0, 5);
   Put_Line ("(2, 5, 25, 9, 35, 60, 29, -55, 0, 5) contiene 7 multiplos de 5");
   Put (multiplos_del_ultimo (V));

   New_Line;
   V := (0, 0, 0, 0, 0, 0, 0, 0, 0, 7);
   Put_Line ("(0, 0, 0, 0, 0, 0, 0, 0, 0, 7) contiene 10 multiplos de 7");
   Put (multiplos_del_ultimo (V));

   New_Line;
   V := (7, 0, 0, 0, 0, 0, 0, 0, 0, 0);
   Put_Line ("(7, 0, 0, 0, 0, 0, 0, 0, 0, 0) contiene 10 multiplos de 0");
   Put (multiplos_del_ultimo (V));
   New_Line;

   V := (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
   Put_Line ("(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) contiene 1 multiplos de 10");
   Put (multiplos_del_ultimo (V));

   -------------------
   -- esta_ordenado --
   -------------------

   New_Line (3);

   V := (1, 2, 3, 4, 5, 6, 7, 8, 9, 0);
   Put_Line ("Es ordenado el vector (1,2,3,4,5,6,7,8,9,0)?");
   Put_Line (esta_ordenado (V)'Img);

   New_Line;
   V := (-1, 3, 5, 7, 9, 15, 25, 35, 35, 35);
   Put_Line ("Es ordenado el vector (-1,3,5,7,9,15,25,35,35,35)?");
   Put_Line (esta_ordenado (V)'Img);

   New_Line;
   V := (9, 8, 8, 8, 8, 8, 8, 8, 8, 8);
   Put_Line ("Es ordenado el vector (9,8,8,8,8,8,8,8,8,8)?");
   Put_Line (esta_ordenado (V)'Img);

   New_Line;
   V := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
   Put_Line ("Es ordenado el vector (0,0,0,0,0,0,0,0,0,0)?");
   Put_Line (esta_ordenado (V)'Img);

   ---------------------
   -- Separar_digitos --
   ---------------------

   New_Line (3);

   num := 908_345;
   separar_digitos (num, V, impares);
   Put_Line ("Vector del numero " & num'Img);
   for i in 1 .. 10 loop
      put (V (i), 2);
   end loop;
   New_Line;
   Put_Line ("Total de numeros impares: " & impares'Img);

   New_Line;
   num := 1;
   separar_digitos (num, V, impares);
   Put_Line ("Vector del numero " & num'Img);
   for i in 1 .. 10 loop
      put (V (i), 2);
   end loop;
   New_Line;
   Put_Line ("Total de numeros impares: " & impares'Img);

   New_Line;
   num := 0_000_000_001;
   separar_digitos (num, V, impares);
   Put_Line ("Vector del numero " & num'Img);
   for i in 1 .. 10 loop
      put (V (i), 2);
   end loop;
   New_Line;
   Put_Line ("Total de numeros impares: " & impares'Img);

   num := 1_357_913_579;
   separar_digitos (num, V, impares);
   Put_Line ("Vector del numero " & num'Img);
   for i in 1 .. 10 loop
      put (V (i), 2);
   end loop;
   New_Line;
   Put_Line ("Total de numeros impares: " & impares'Img);

   num := 1_000_000_000;
   separar_digitos (num, V, impares);
   Put_Line ("Vector del numero " & num'Img);
   for i in 1 .. 10 loop
      put (V (i), 2);
   end loop;
   New_Line;
   Put_Line ("Total de numeros impares: " & impares'Img);

   -----------------------
   -- binario_a_decimal --
   -----------------------

   New_Line (3);

   V := (0, 0, 0, 0, 0, 0, 0, 1, 0, 1);
   Put_Line ("El numero 0000000101 a en decimal es 5");
   Put_Line (Binario_A_Decimal (V)'Img);

   V := (1, 0, 0, 0, 1, 0, 0, 1, 1, 1);
   Put_Line ("El numero 1000100111 en decimal es 551");
   Put_Line (Binario_A_Decimal (V)'Img);

   V := (1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
   Put_Line ("El numero 1111111111 en decimal es 1023");
   Put_Line (Binario_A_Decimal (V)'Img);

   V := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
   Put_Line ("El numero 0000000000 en decimal es 0");
   Put_Line (Binario_A_Decimal (V)'Img);

   -----------
   -- Rot13 --
   -----------

   New_Line (3);

   Sin_Cifrar := "HOLAMUNDO!";
   Put_Line ("""HOLAMUNDO!"" en Rot13 es UBYNZHAQB!");
   Rot13 (Sin_Cifrar, Cifrado);
   Put_Line (Cifrado);

   New_Line;
   Sin_Cifrar := "holamundo!";
   Put_Line ("""holamundo!"" en Rot13 es ubynzhaqb!");
   Rot13 (Sin_Cifrar, Cifrado);
   Put_Line (Cifrado);

   New_Line;
   Sin_Cifrar := "ubynzhaqb!";
   Put_Line ("""ubynzhaqb!"" en Rot13 es holamundo!");
   Rot13 (Sin_Cifrar, Cifrado);
   Put_Line (Cifrado);

   --------------------
   -- Digito_Control --
   --------------------

   New_Line (3);

   V := (1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
   Put_Line ("El digito de control para 1111111111 es 0");
   Put_Line (digito_control (v)'Img);

   New_Line;
   V := (1, 2, 3, 4, 5, 6, 7, 8, 9, 8);
   Put_Line ("El digito de control para 1234567898 es 2");
   Put_Line (digito_control (v)'Img);

   New_Line;
   V := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
   Put_Line ("El digito de control para 0000000000 es 0");
   Put_Line (digito_control (v)'Img);

   New_Line;
   V := (9, 9, 9, 9, 9, 9, 9, 9, 9, 9);
   Put_Line ("El digito de control para 9999999999 es 0");
   Put_Line (digito_control (v)'Img);

   -----------------------
   -- Numero_Misterioso --
   -----------------------

   New_Line (3);

   Num_Misterioso (Num2);
   Put_Line (Num2);

   ---------------------------------------------------
   -- Digito_Control_Tarjeta // Numeracion_Correcta --
   ---------------------------------------------------

   New_Line (3);

   V2 := (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
   Put_Line ("El digito de control para 111111111111111 es 7");
   Incluir_Digito_Control (V2);
   for i in 1 .. 16 loop
      put (V2 (i), 2);
   end loop;
   New_Line;
   Put_Line (es_Correcta (V2)'Img);

   New_Line (2);
   V2 := (1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 9, 8, 7, 6, 5, 1);
   Put_Line ("El digito de control para 123456789098765 es 8");
   Incluir_Digito_Control (V2);
   for i in 1 .. 16 loop
      put (V2 (i), 2);
   end loop;
   New_Line;
   Put_Line (es_Correcta (V2)'Img);

   New_Line (2);
   V2 := (3, 6, 5, 4, 2, 7, 3, 9, 1, 1, 0, 5, 2, 8, 5, 1);
   Put_Line ("El digito de control para 365427391105285 es 6");
   Incluir_Digito_Control (V2);
   for i in V2'Range loop
      put (V2 (i), 2);
   end loop;
   New_Line;
   Put_Line (es_Correcta (V2)'Img);

   New_Line (2);
   V2 := (7, 4, 9, 3, 6, 1, 2, 8, 3, 6, 9, 0, 0, 3, 4, 1);
   Put_Line ("El digito de control para 749361283690034 es 1");
   Incluir_Digito_Control (V2);
   for i in V2'Range loop
      put (V2 (i), 2);
   end loop;
   New_Line;
   Put_Line (es_Correcta (V2)'Img);

   New_Line (2);
   V2 := (7, 9, 9, 2, 7, 3, 9, 8, 7, 1, 3, 0, 0, 3, 4, 1);
   Put_Line ("El digito de control para 799273987130034 es 7");
   Incluir_Digito_Control (V2);
   for i in V2'Range loop
      put (V2 (i), 2);
   end loop;
   New_Line;
   Put_Line (es_Correcta (V2)'Img);

   --------------------------
   -- Incluir_Digitos_IBAN --
   --------------------------

   New_Line (3);

   Incluir_Digitos_IBAN ("ES", 19, 20, (1, 2, 3, 4, 5, 6, 7, 8, 9, 0), IBAN);
   Put_Line (IBAN);
   New_Line (2);

   Incluir_Digitos_IBAN ("AD", 1, 2030, (0, 3, 5, 9, 1, 0, 0, 1, 0, 0), IBAN);
   Put_Line (IBAN);
   New_Line (2);

   Incluir_Digitos_IBAN ("AD", 8, 1, (1, 2, 3, 4, 5, 6, 7, 8, 9, 0), IBAN);
   Put_Line (IBAN);
   New_Line (2);

   Incluir_Digitos_IBAN ("CZ", 800, 0, (2, 0, 0, 0, 1, 4, 5, 3, 9, 9), IBAN);
   Put_Line (IBAN);
   New_Line (2);

   Incluir_Digitos_IBAN ("ES", 2100, 418, (0, 2, 0, 0, 0, 5, 1, 3, 3, 2), IBAN);
   Put_Line (IBAN);
   New_Line (2);

   -----------
   -- Rot13 --
   -----------

   New_Line (3);

   Texto := ("HOLAMUNDO");
   Rot13 (Texto);
   Put_Line (Texto);

   New_Line;
   Texto := ("UBYNZHAQB");
   Rot13 (Texto);
   Put_Line (Texto);

   New_Line;
   Texto := ("ubynzhaqb");
   Rot13 (Texto);
   Put_Line (Texto);

   New_Line;
   Texto := ("12345^?.:");
   Rot13 (Texto);
   Put_Line (Texto);

   ------------------
   -- Mayusculizar --
   ------------------

   New_Line (3);

   Get_Line (text, c);
   New_Line (2);
   text := Mayusculizar (text);
   Head (text, c, Left);
   Put_Line (text);

   --------------
   -- Poetizar --
   --------------

   New_Line (3);

   poetizar;

end Lab06_Pruebas;
