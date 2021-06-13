<div class="main-sidebar">
  <aside id="sidebar-wrapper">
    <div class="sidebar-brand">
      <a href="index.html">PENGADUAN MASYARAKAT</a>
    </div>
    <div class="sidebar-brand sidebar-brand-sm">
      <a href="index.html">PD</a>
    </div>
      <ul class="sidebar-menu">
        @if (Auth::guard('admin')->user()->status == 'admin')
        {{-- Dashboard --}}
        <li class="menu-header">Dashboard</li>
        <li class="@yield('dashboard')"><a class="nav-link" href="/dashboard"><i class="fas fa-fire"></i> <span>Dashboard</span></a></li>
    
        {{-- Entry data --}}
        <li class="menu-header">Entry data</li>
        <li class="@yield('petugas')"><a class="nav-link" href="/petugas"><i class="fas fa-user"></i> <span>Petugas</span></a></li>
        <li class="@yield('masyarakat')"><a class="nav-link" href="/masyarakat"><i class="fas fa-user"></i> <span>Masyarakat</span></a></li>

        @endif

        {{-- Pengaduan --}}
        <li class="menu-header">Pengaduan</li>
        <li class="@yield('pengaduan')"><a class="nav-link" href="/pengaduan"><i class="fas fa-database"></i> <span>Entry Pengaduan</span></a></li>
        <li class="@yield('tanggapan')"><a class="nav-link" href="/tanggapan"><i class="fas fa-database"></i> <span>Entry Tanggapan</span></a></li>
 
         {{-- Transaksi --}}
         <li class="menu-header">Transaksi</li>
         <li class="@yield('transaksi')"><a class="nav-link" href="/list"><i class="fas fa-database"></i> <span>Menu Transaksi</span></a></li>

         @if (Auth::guard('admin')->user()->status == 'admin')
         {{-- Laporan --}}
         <li class="menu-header">Laporan</li>
         <li class="@yield('laporan')"><a class="nav-link" href="/laporan"><i class="fas fa-print"></i> <span>Rekap laporan</span></a></li>          
         @endif
      </ul>
  </aside>
</div>