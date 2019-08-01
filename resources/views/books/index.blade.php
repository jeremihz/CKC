
@extends('layouts.dashboard')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Church Documents</div>

                <div class="card-body">

                    <a href="{{ route('books.create') }}" class="btn btn-primary">Add new Document</a>
                    <br /><br />

                    <table class="table">
                        <tr>
                            <th>Title</th>
                            <th>Download file</th>
                        </tr>
                        @forelse ($books as $book)
                            <tr>
                                <td>{{ $book->title }}</td>
                                <td><a href="{{ route('books.download', $book->uuid) }}">{{ $book->cover }}</a></td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="2">No Documents found.</td>
                            </tr>
                        @endforelse
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
