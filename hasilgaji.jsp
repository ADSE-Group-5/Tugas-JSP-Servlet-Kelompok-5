<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Hasil - Gaji &amp; Tabungan</title>
<style>
  body { margin:0; padding:40px 20px; min-height:100vh; box-sizing:border-box;
    background: radial-gradient(circle at 80% 10%, #1b1035 0%, #0a0a17 60%);
    font-family:'Segoe UI',sans-serif; color:#e6e6f0;
    display:flex; align-items:flex-start; justify-content:center; }
  .card { background: rgba(255,255,255,0.05); border:1px solid rgba(255,255,255,0.12);
    border-radius:16px; padding:32px 36px; width:520px; max-width:100%; backdrop-filter: blur(10px);
    box-shadow:0 8px 32px rgba(0,0,0,0.4); }
  h1 { color:#a78bfa; font-size:20px; margin:0 0 2px;}
  .sub { color:#8b8ba7; font-size:13px; margin-bottom:16px;}
  table { width:100%; border-collapse:collapse; margin:14px 0; }
  th, td { border:1px solid rgba(255,255,255,0.15); padding:8px 10px; font-size:13px; text-align:left; }
  th { background: rgba(167,139,250,0.15); color:#c4b5fd; width:55%; }
  .badge { display:inline-block; padding:6px 14px; border-radius:20px; font-size:12px; font-weight:700; margin:6px 0 4px; }
  .bisa  { background:#064e3b; color:#6ee7b7; border:1px solid #10b981; }
  .tidak { background:#3f2d0a; color:#fcd34d; border:1px solid #f59e0b; }
  .cari  { background:#4c0519; color:#fda4af; border:1px solid #f43f5e; }
  .rumus { margin-top:16px; padding:12px; border-radius:8px; background:#0f0f1e;
    border:1px solid rgba(255,255,255,0.1); font-family:'Consolas',monospace; font-size:12px;
    color:#93e6c8; line-height:1.7; word-break:break-word; }
  a.btn { display:inline-block; margin-top:18px; padding:10px 16px; border-radius:8px;
    background: linear-gradient(90deg,#6d28d9,#3b82f6); color:#fff; text-decoration:none; font-size:13px; }
</style>
</head>
<body>
<div class="card">
  <h1>Hasil Perhitungan</h1>
  <div class="sub">Karyawan: <b>${nama}</b></div>

  <table>
    <tr><th>Komponen</th><th>Nilai</th></tr>
    <tr><td>Jam kerja</td><td>${jamKerja} jam</td></tr>
    <tr><td>Jam normal</td><td>${jamNormal} jam &times; Rp${rateNormal}/jam</td></tr>
    <tr><td>Jam lembur</td><td>${jamLembur} jam &times; Rp${rateLembur}/jam</td></tr>
    <tr><td>Gaji normal</td><td>Rp${gajiNormal}</td></tr>
    <tr><td>Gaji lembur</td><td>Rp${gajiLembur}</td></tr>
    <tr><td><b>Total gaji (pemasukan)</b></td><td><b>Rp${totalGaji}</b></td></tr>
    <tr><td>Pengeluaran minggu ini</td><td>Rp${pengeluaran}</td></tr>
  </table>

  <%
    String status = (String) request.getAttribute("statusTabungan");
    String badgeClass = "tidak";
    if ("BISA MENABUNG".equals(status)) badgeClass = "bisa";
    else if ("CARI TAMBAHAN".equals(status)) badgeClass = "cari";
  %>
  <div class="badge <%=badgeClass%>"><%=status%></div>

  <% if ("BISA MENABUNG".equals(status)) { %>
    <table><tr><th>Tabungan minggu ini</th><td>Rp${tabungan}</td></tr></table>
  <% } else if ("CARI TAMBAHAN".equals(status)) { %>
    <table><tr><th>Kekurangan</th><td>Rp${kekurangan}</td></tr></table>
  <% } %>

  <div class="rumus">
    Total gaji = (40 &times; Rp${rateNormal}) + ((${jamKerja}-40) &times; 1.5 &times; Rp${rateNormal})<br>
    = Rp${gajiNormal} + Rp${gajiLembur} = Rp${totalGaji}<br>
    Status = pemasukan (Rp${totalGaji}) dibandingkan pengeluaran (Rp${pengeluaran})
  </div>

  <a class="btn" href="gaji.jsp">&larr; Hitung Lagi</a>
</div>
</body>
</html>
