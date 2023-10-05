with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Maps, Ada.Strings.Fixed; use Ada.Strings.Maps, Ada.Strings.Fixed;
with Ada.Strings; use Ada.Strings;

package body Laboratorio06 is

   ------------------------------------------------------------
   --AUTHOR: BERGARETXE LOPEZ, LUKA
   ------------------------------------------------------------

   ----------------
   -- Ultimo_Par --
   ----------------

   procedure Ultimo_Par(V: in T_Vector10; Ultimo_Par: out Integer; Posicion: out Natural) is
   begin
      Ultimo_Par := 0;
      Posicion := 0;
      for i in V'range loop
         if V(i) mod 2 = 0 then
            Ultimo_Par := V(i);
            Posicion := i;
         end if;
      end loop;
   end Ultimo_Par;

   --------------------------
   -- multiplos_del_ultimo --
   --------------------------

   function multiplos_del_ultimo (V: in T_Vector10) return Positive is
      multiplos : Positive := 1;
   begin
      for i in 1..V'Length-1 loop
         if V(V'Length) = 0 then
            multiplos := V'Length;
         else
            if V(i) mod V(V'Length) = 0 then
               multiplos := multiplos + 1;
            end if;
         end if;
      end loop;
      return multiplos;
   end multiplos_del_ultimo;

   -------------------
   -- esta_ordenado --
   -------------------

   function esta_ordenado (V: in T_Vector10) return Boolean is
      i : Positive := 1;
      ord : Boolean := TRUE;
   begin
      while V(i + 1) = V(i) and i < V'Length - 1 loop
         i := i + 1;
      end loop;
      if V(i + 1) > V(i) then
         i := i + 1;
         for j in i..V'Length - 1 loop
            ord := ord and V(j + 1) >= V(j);
            exit when ord = FALSE;
         end loop;
      else
         i := i + 1;
         for k in i..V'Length - 1 loop
            ord := ord and V(k + 1) <= V(k);
            exit when ord = FALSE;
         end loop;
      end if;
      return ord;
   end esta_ordenado;

   ---------------------
   -- Separar_digitos --
   ---------------------

   procedure Separar_digitos(Num: In Natural; V: out T_Vector10; impares: out Natural) is
   begin
      impares := 0;
      for i in V'range loop
         V(i) := (Num / (10**(V'Length - i)) mod 10);
         impares := impares + Boolean'Pos(V(i) mod 2 /= 0);
      end loop;
   end Separar_digitos;

   -----------------------
   -- binario_a_decimal --
   -----------------------
   function binario_a_decimal (V: in T_Vector10) return Natural is
      decimal : Natural := 0;
   begin
      for i in V'range loop
         decimal := decimal + V(i) * 2**(V'Length - i);
      end loop;
      return decimal;
   end binario_a_decimal;

   -----------
   -- Rot13 --
   -----------
   procedure Rot13 (Sin_Cifrar: in STRING; Cifrado: out STRING) is
   begin
      for i in Sin_Cifrar'Range loop
         case Sin_Cifrar(i) is
            when 'a'..'z' => Cifrado(i) := Character'Val((Character'Pos(Sin_Cifrar(i)) - Character'Pos('a') + 13) mod 26 + Character'Pos('a'));
            when 'A'..'Z' => Cifrado(i) := Character'Val((Character'Pos(Sin_Cifrar(i)) - Character'Pos('A') + 13) mod 26 + Character'Pos('A'));
            when others => Cifrado(i) := Sin_Cifrar(i);
         end case;
      end loop;
   end Rot13;

   --------------------
   -- Digito_Control --
   --------------------
   function Digito_Control (Codigo_Cuenta: in T_Vector10) return Natural is
      d : Natural := 0;
   begin
      for i in 1..10 loop
         d := d + Codigo_Cuenta(i) * (2**(i-1) rem 11);
      end loop;
      d := 11 - d rem 11;
      if d = 11 then
         d := 0;
      elsif d = 10 then
         d := 1;
      end if;
      return d;
   end Digito_Control;

   --------------------
   -- Num_Misterioso --
   --------------------

   procedure Num_Misterioso (Num:out String) is
   begin
      Num := "0000500000";
      bucle: for a in 1..9 loop
         for b in 1..4 loop
            if 2*b /= a then
               for c in 1..9 loop
                  if c /= 2*b and c /= a then
                     for d in 1..4 loop
                        if 2*d /= c and 2*d /= 2*b and 2*d /= a then
                           for f in 1..4 loop
                              if 2*f /= 5 and 2*f /= 2*d and 2*f /= c and 2*f /= 2*b and 2*f /= a then
                                 for g in 1..9 loop
                                    if g /= 2*f and g /= 5 and g /= 2*d and g /= c and g /= 2*b and g /= a then
                                       for h in 1..4 loop
                                          if 2*h /= g and 2*h /= 2*f and 2*h /= 5 and 2*h /= 2*d and 2*h /= c and 2*h /= 2*b and 2*h /= a then
                                             for i in 1..9 loop
                                                if i /= 2*h and  i /= g and i /= 2*f and i /= 5 and i /= 2*d and i /= c and i /= 2*b and i /= a then
                                                   if (a+(2*b)+c+(2*d)+(5)+(2*f)+g+(2*h)+i) mod 9 = 0 then
                                                      if (a*2**7+(2*b)*2**6+c*2**5+(2*d)*2**4+(5)*2**3+(2*f)*2**2+g*2+(2*h)) mod 8 = 0 then
                                                         if (a*3**6+(2*b)*3**5+c*3**4+(2*d)*3**3+(5)*3**2+(2*f)*3+g) mod 7 = 0 then
                                                            if (a*4**5+(2*b)*4**4+c*4**3+(2*d)*4**2+(5)*4+(2*f)) mod 6 = 0 then
                                                               if (a*5**4+(2*b)*5**3+c*5**2+(2*d)*5+(5)) mod 5 = 0 then
                                                                  if (a*6**3+(2*b)*6**2+c*6+(2*d)) mod 4 = 0 then
                                                                     if (a*7**2+(2*b)*7+c) mod 3 = 0 then
                                                                        if (a*8+(2*b)) mod 2 = 0 then
                                                                           for k in 1..Num'Length loop
                                                                              Num(Num'first) := Character'Val(48 + a); Num(Num'first+1) := Character'Val(48 + 2*b); Num(Num'first+2) := Character'Val(48 + c); Num(Num'first+3) := Character'Val(48 + 2*d); Num(Num'first+5) := Character'Val(48 + 2*f); Num(Num'first+6) := Character'Val(48 + g); Num(Num'first+7) := Character'Val(48 + 2*h); Num(Num'first+8) := Character'Val(48 + i);
                                                                           end loop;
                                                                           exit bucle;
                                                                        end if;
                                                                     end if;
                                                                  end if;
                                                               end if;
                                                            end if;
                                                         end if;
                                                      end if;
                                                   end if;
                                                end if;
                                             end loop;
                                          end if;
                                       end loop;
                                    end if;
                                 end loop;
                              end if;
                           end loop;
                        end if;
                     end loop;
                  end if;
               end loop;
            end if;
         end loop;
      end loop bucle;
   end Num_Misterioso;

   ----------------------------
   -- Incluir_Digito_Control --
   ----------------------------
   function F(X,Pos: in Natural) return Natural is
      r : Natural;
   begin
      if Pos mod 2 = 1 then
         r := X;
      elsif X < 5 then
         r := 2*X;
      else
         r := 2*X - 9;
      end if;
      return r;
   end F;

   procedure Incluir_Digito_Control (Tarjeta: in out T_Vector16) is
      d : Natural := 0;
   begin
      for i in reverse Tarjeta'First..Tarjeta'Last - 1 loop
         d := d + F(Tarjeta(i),(Tarjeta'Last - i) + 1);
      end loop;
      Tarjeta(Tarjeta'Last) := (10 - d rem 10) rem 10;
   end Incluir_Digito_Control;

   -----------------
   -- Es_Correcta --
   -----------------

   function Es_Correcta (Tarjeta: in T_Vector16) return Boolean is
      d : Natural := 0;
      c : Boolean;
   begin
      for i in reverse Tarjeta'First..Tarjeta'Last loop
         d := d + F(Tarjeta(i),(Tarjeta'Last - i) + 1);
      end loop;
      if d mod 10 = 0 then
         c := TRUE;
      else
         c := FALSE;
      end if;
      return c;
   end Es_Correcta;

   --------------------------
   -- Incluir_Digitos_IBAN --
   --------------------------

   procedure vector_digitos(Num: in Natural; V : out T_Vector) is
   begin
      for i in V'range loop
         V(i) := (Num / (10**(V'Length - i)) mod 10);
      end loop;
   end vector_digitos;

   function vectorizar (S : in String) return T_Vector is
      V : T_Vector(S'range);
   begin
      for i in S'range loop
         V(i) := Character'Pos(S(i)) - 48;
      end loop;
      return V;
   end vectorizar;

   function caracterizar (V : in T_Vector) return String is
      S : String(1..V'length);
   begin
      for i in S'range loop
         S(i) := Character'Val(V(V'first + i - 1) + 48);
      end loop;
      return S;
   end caracterizar;

   function div_larga (V : in T_Vector; N : in Natural) return Natural is
      r : Natural := 0;
   begin
      for i in V'range loop
         r := (10 * r + V(i)) mod n;
      end loop;
      return r;
   end div_larga;

   procedure Incluir_Digitos_IBAN (Pais: in String; Banco, Sucursal: in Integer; Numero_Cuenta: T_Vector10; IBAN: out STRING) is
      C1, C2 : Natural;
      KK : T_Vector(1..2);
      BBBB, SSSS : T_Vector(1..4);
      N : Natural;
   begin
      vector_digitos(Banco, BBBB);
      vector_digitos(Sucursal, SSSS);
      C1 := Digito_Control ((0,0) & BBBB & SSSS);
      C2 := Digito_Control (Numero_Cuenta);
      N := 98 - div_larga(BBBB & SSSS & C1 & C2 & Numero_Cuenta
            & Vectorizar(Integer'Image(Character'Pos(Pais(Pais'first)) - 55)(2..3))
            & Vectorizar(Integer'Image(Character'Pos(Pais(Pais'first+1)) - 55)(2..3))
            & (0,0), 97);
      vector_digitos(N, KK);
      IBAN := Pais & caracterizar(KK) & " " & caracterizar(BBBB) & " " & caracterizar(SSSS)
         & " " & caracterizar(C1 & C2 & Numero_Cuenta(Numero_Cuenta'first..Numero_Cuenta'first+1))
         & " " & caracterizar(Numero_Cuenta(Numero_Cuenta'first+2..Numero_Cuenta'first+5))
         & " " & caracterizar(Numero_Cuenta(Numero_Cuenta'first+6..Numero_Cuenta'last));
   end Incluir_Digitos_IBAN;

   -----------
   -- Rot13 --
   -----------

   procedure Rot13 (Texto: in out STRING) is
      rot13 : constant Character_Mapping := To_Mapping("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz","NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm");
   begin
      Translate(Texto, rot13);
   end Rot13;

   ------------------
   -- Mayusculizar --
   ------------------

   function Mayusculizar (Texto: in String) return String is
      t : String := Texto;
      mayus : constant Character_Mapping := To_Mapping("abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ");
   begin
      Translate(t, mayus);
      return t;
   end Mayusculizar;

   --------------
   -- Poetizar --
   --------------

   procedure Poetizar is
      t : string (1..40);
      c : natural;
   begin
      while not end_of_file loop
         get_line(t, c);
         head(t, c, Center);
         put_line(t);
      end loop;
   end Poetizar;

end Laboratorio06;
