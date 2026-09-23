package com.tugas.servlet;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Soal "John Travolta"
 * ---------------------------------------------------------
 * Soal 1: Hitung gaji mingguan dengan aturan lembur.
 *         - Jam normal (<=40 jam)  : rate normal / jam
 *         - Jam lembur (>40 jam)   : 1.5 x rate normal / jam
 *
 * Soal 2: Tentukan status tabungan minggu ini.
 *         - pemasukan  > pengeluaran -> "BISA MENABUNG"
 *         - pemasukan == pengeluaran -> "TIDAK BISA MENABUNG"
 *         - pemasukan  < pengeluaran -> "CARI TAMBAHAN"
 *
 * Arsitektur: MVC sederhana (sama seperti tugas Kelompok 5)
 *   View (input)  : gaji.jsp
 *   Controller     : GajiTabunganServlet (kelas ini)
 *   View (output)  : hasilgaji.jsp
 */
public class GajiTabunganServlet extends HttpServlet {

    private static final double JAM_NORMAL_MAX = 40.0;
    private static final double FAKTOR_LEMBUR = 1.5;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ---------- Ambil parameter dari form ----------
        String nama = request.getParameter("nama");
        double jamKerja = Double.parseDouble(request.getParameter("jamKerja"));
        double rateNormal = Double.parseDouble(request.getParameter("rateNormal"));
        double pengeluaran = Double.parseDouble(request.getParameter("pengeluaran"));

        // =====================================================
        // SOAL 1 : HITUNG GAJI (dengan aturan lembur)
        // =====================================================
        double jamNormal;
        double jamLembur;
        double rateLembur;
        double gajiNormal;
        double gajiLembur;

        if (jamKerja <= JAM_NORMAL_MAX) {
            // Tidak ada lembur
            jamNormal = jamKerja;
            jamLembur = 0;
            rateLembur = 0;
            gajiNormal = jamNormal * rateNormal;
            gajiLembur = 0;
        } else {
            // Ada lembur di atas 40 jam
            jamNormal = JAM_NORMAL_MAX;
            jamLembur = jamKerja - JAM_NORMAL_MAX;
            rateLembur = FAKTOR_LEMBUR * rateNormal;
            gajiNormal = jamNormal * rateNormal;
            gajiLembur = jamLembur * rateLembur;
        }

        double totalGaji = gajiNormal + gajiLembur;

        // =====================================================
        // SOAL 2 : STATUS TABUNGAN
        // =====================================================
        double pemasukan = totalGaji; // gaji minggu ini dianggap sebagai pemasukan
        String statusTabungan;
        double tabungan = 0;
        double kekurangan = 0;

        if (pemasukan > pengeluaran) {
            statusTabungan = "BISA MENABUNG";
            tabungan = pemasukan - pengeluaran;
        } else if (pemasukan == pengeluaran) {
            statusTabungan = "TIDAK BISA MENABUNG";
        } else {
            statusTabungan = "CARI TAMBAHAN";
            kekurangan = pengeluaran - pemasukan;
        }

        // ---------- Format angka ke Rupiah (ribuan) ----------
        DecimalFormat df = new DecimalFormat("#,###");

        // ---------- Kirim hasil ke JSP ----------
        request.setAttribute("nama", nama);
        request.setAttribute("jamKerja", df.format(jamKerja));
        request.setAttribute("jamNormal", df.format(jamNormal));
        request.setAttribute("jamLembur", df.format(jamLembur));
        request.setAttribute("rateNormal", df.format(rateNormal));
        request.setAttribute("rateLembur", df.format(rateLembur));
        request.setAttribute("gajiNormal", df.format(gajiNormal));
        request.setAttribute("gajiLembur", df.format(gajiLembur));
        request.setAttribute("totalGaji", df.format(totalGaji));
        request.setAttribute("pengeluaran", df.format(pengeluaran));
        request.setAttribute("statusTabungan", statusTabungan);
        request.setAttribute("tabungan", df.format(tabungan));
        request.setAttribute("kekurangan", df.format(kekurangan));

        request.getRequestDispatcher("hasilgaji.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // izinkan akses langsung via GET juga, diarahkan balik ke form
        response.sendRedirect("gaji.jsp");
    }
}
