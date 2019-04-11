"  Author:  Chih-Long Chang
" Created:  2018/6/27
" Version:  1.1

function! CSV()
perl << EOF
    my ( $n1, $n2 ) = ( 1, $curbuf->Count );
    my @csv = $curbuf->Get( $n1 .. $n2 );
    my @dat = ();
    my @len = ();
    $curbuf->Delete( $n1, $n2 );
    for ( my $i = 0 ; $i <= $#csv ; $i++ ) {
        $_ = $csv[$i];
        while ( y/"// % 2 ) {
            last unless defined( my $t = $csv[ ++$i ] );
            $_ .= " $t";
        }
        my @a = ();
        s/("(?:""|[^"])*"|[^",]*),?/push@a,$1/ge;
        for (@a) {
            $_ = $1 if /^"(.*)"$/;
            s/""/"/g;
            s/\s+/ /g;
            s/^\s//;
            s/\s$//;
        }
        push @dat, \@a;
    }
    for my $i ( 0 .. $#dat ) {
        for my $j ( 0 .. $#{ $dat[$i] } - 1 ) {
            if ( !defined $len[$j] || $len[$j] < length $dat[$i][$j] ) {
                $len[$j] = length $dat[$i][$j];
            }
        }
    }
    for my $i ( 0 .. $#dat ) {
        my $str = '';
        for my $j ( 0 .. $#{ $dat[$i] } - 1 ) {
            $str .= sprintf "%-$len[$j]s ¦ ", $dat[$i][$j];
        }
        $dat[$i] = $str;
    }
    $curbuf->Append( 0, @dat );
    $curbuf->Delete( $curbuf->Count );
EOF
endfunction

function! CSV_()
perl << EOF
    my ( $n1, $n2 ) = ( 1, $curbuf->Count );
    my @dat = $curbuf->Get( $n1 .. $n2 );
    my @csv = ();
    $curbuf->Delete( $n1, $n2 );
    for (@dat) {
        push @csv, join ',', map { s/"/""/g; /,|"/ ? "\"$_\"" : $_ }
          split /\s*¦\s*/, $_, -1;
    }
    $curbuf->Append( 0, @csv );
    $curbuf->Delete( $curbuf->Count );
EOF
endfunction

set encoding=utf-8
au BufRead,BufNewFile *.csv nnoremap <buffer> <F12>   :call CSV()<CR>
au BufRead,BufNewFile *.csv nnoremap <buffer> <S-F12> :call CSV_()<CR>
" vim: set ft=vim :
