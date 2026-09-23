<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Soal John Travolta - Gaji &amp; Tabungan</title>
<style>
  body {
    margin:0; padding:0; min-height:100vh;
    background: radial-gradient(circle at 20% 20%, #1b1035 0%, #0a0a17 60%);
    font-family: 'Segoe UI', sans-serif;
    color:#e6e6f0;
    display:flex; align-items:center; justify-content:center;
  }
  .card {
    background: rgba(255,255,255,0.05);
    border: 1px solid rgba(255,255,255,0.12);
    border-radius: 16px;
    backdrop-filter: blur(10px);
    padding: 32px 36px;
    width: 420px;
    box-shadow: 0 8px 32px rgba(0,0,0,0.4);
  }
  h1 { color:#a78bfa; font-size:20px; margin:0 0 4px; }
  .subtitle { color:#8b8ba7; font-size:12px; letter-spacing:.5px; margin-bottom:20px; }
  label { display:block; font-size:13px; color:#c7c7e0; margin:14px 0 6px; }
  input {
    width:100%; box-sizing:border-box; padding:10px 12px;
    border-radius:8px; border:1px solid rgba(255,255,255,0.15);
    background: rgba(255,255,255,0.04); color:#fff; font-size:14px;
  }
  input:focus { outline:none; border-color:#a78bfa; }
  button {
    width:100%; margin-top:22px; padding:12px;
    border:none; border-radius:8px; font-size:14px; font-weight:600;
    background: linear-gradient(90deg,#6d28d9,#3b82f6); color:#fff; cursor:pointer;
  }
  button:hover { opacity:0.9; }
  .rumus {
    margin-top:18px; padding:12px; border-radius:8px;
    background:#0f0f1e; border:1px solid rgba(255,255,255,0.1);
    font-family: 'Consolas', monospace; font-size:12px; color:#93e6c8; line-height:1.7;
  }
</style>
</head>
<body>
  <div class="card">
    <h1>&#128188; Gaji &amp; Tabungan</h1>
    <div class="subtitle">SOAL JOHN TRAVOLTA &middot; LEMBUR + STATUS MENABUNG</div>

    <form action="HitungGaji" method="post">
      <label>NAMA KARYAWAN</label>
      <input type="text" name="nama" value="John Travolta" required>

      <label>JAM KERJA MINGGU INI</label>
      <input type="number" step="0.5" min="0" name="jamKerja" value="52" required>

      <label>RATE NORMAL / JAM (RP)</label>
      <input type="number" step="500" min="0" name="rateNormal" value="15000" required>

      <label>PENGELUARAN MINGGU INI (RP)</label>
      <input type="number" step="1000" min="0" name="pengeluaran" value="600000" required>

      <button type="submit">Hitung Sekarang &rarr;</button>

      <div class="rumus">
        Gaji normal = jam &times; rate (maks 40 jam)<br>
        Gaji lembur = (jam &minus; 40) &times; 1.5 &times; rate<br>
        Tabungan = pemasukan &minus; pengeluaran
      </div>
    </form>
  </div>
</body>
</html>
