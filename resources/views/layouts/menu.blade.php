@if(auth()->user()->role->name == "Admin")
    @include('layouts.menu.admin')
@endif

@if(auth()->user()->role->name == "Pegawai")
    @include('layouts.menu.pegawai')
@endif