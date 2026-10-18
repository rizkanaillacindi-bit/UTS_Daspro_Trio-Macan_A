program ATM_Sederhana;

const
  PIN_BENAR = 0101;

var
  pilihan, pin, percobaan, i, banyak: integer;
  saldo, jumlah: real;
  berhasil: boolean;

begin
  saldo := 1000000;
  berhasil := false;
  percobaan := 0;

  writeln('===== SELAMAT DATANG DI ATM =====');
  while percobaan < 3 do
  begin
    write('Masukkan PIN: ');
    readln(pin);
    percobaan := percobaan + 1;
    if pin = PIN_BENAR then
    begin
      berhasil := true;
      break;
    end
    else
      writeln('PIN salah! Sisa percobaan: ', 3 - percobaan);
  end;

  if not berhasil then
    writeln('Kartu diblokir. Hubungi bank.')
  else
  begin
    repeat
      writeln;
      writeln('===== MENU ATM =====');
      writeln('1. Cek saldo');
      writeln('2. Setor tunai');
      writeln('3. Tarik tunai');
      writeln('4. Setor beberapa kali');
      writeln('0. Keluar');
      write('Pilih menu: ');
      readln(pilihan);
      writeln;

      case pilihan of
        1: writeln('Saldo Anda: Rp ', saldo:0:0);

        2: begin
             write('Jumlah setor: Rp ');
             readln(jumlah);
             if jumlah <= 0 then
               writeln('Jumlah tidak valid!')
             else
             begin
               saldo := saldo + jumlah;
               writeln('Setor berhasil. Saldo: Rp ', saldo:0:0);
             end;
           end;

        3: begin
             write('Jumlah tarik: Rp ');
             readln(jumlah);
             if jumlah <= 0 then
               writeln('Jumlah tidak valid!')
             else
             begin
               if (jumlah / 50000) <> trunc(jumlah / 50000) then
                 writeln('Harus kelipatan Rp 50.000!')
               else
               begin
                 if jumlah > saldo then
                   writeln('Saldo tidak cukup!')
                 else
                 begin
                   saldo := saldo - jumlah;
                   writeln('Tarik berhasil. Saldo: Rp ', saldo:0:0);
                 end;
               end;
             end;
           end;

        4: begin
             write('Berapa kali setor? ');
             readln(banyak);
             for i := 1 to banyak do
             begin
               write('Setoran ke-', i, ': Rp ');
               readln(jumlah);
               if jumlah <= 0 then
               begin
                 writeln('Tidak valid, dilewati');
                 continue;
               end;
               saldo := saldo + jumlah;
             end;
             writeln('Saldo sekarang: Rp ', saldo:0:0);
           end;

        0: writeln('Terima kasih. Jangan lupa ambil kartu Anda!');
      else
        writeln('Menu tidak tersedia!');
      end;
    until pilihan = 0;
  end;
end.