+++
title = "About"

extra.in_header = true
+++

> *KNOW XEREX* 
  * I am Arnav Kumar Banerjee, a Computer Science undergrad from India 🇮🇳.
  * I am interested in a lot of things and this site is to muse about those things. 
  * I am strong believer in hosting your data in a sane fashion , hence stuff that is dear to me, is found at [xegit](https://git.xemon.xyz)
  * I am from  🏝️ [Andaman and Nicobar Islands](https://en.wikipedia.org/wiki/Andaman_and_Nicobar_Islands)
<br/>  
> likes *RUST AND FOSS*
  * NO TUX NO BUX 🐧
  * KEEP IT RUSTY 🦀

### Strives to make things I LIKE :
![](/images/free_as_in_freedom.png)



> *MANDLEBROT SET IN RUST* : 

```rust 


// This is cool visual of a fractal , we are fractals too !!
use num::complex::Complex;
fn calc_mandle(
    max_iters: usize,
    x_min: f64,
    x_max: f64,
    y_min: f64,
    y_max: f64, // {x_min, y_min , x_max , y_max } define the bounding box
    width: usize,
    height: usize,
) -> Vec<Vec<usize>> {
    let mut rows: Vec<_> = Vec::with_capacity(width);
    for img_y in 0..height {
        let mut row: Vec<usize> = Vec::with_capacity(height);
        for img_x in 0..width {
            let x_percent = img_x as f64 / width as f64;
            let y_percent = img_y as f64 / height as f64;
            let cx = x_min + (x_max - x_min) * x_percent;
            let cy = y_min + (y_max - y_min) * y_percent;
            let escape_at = mandle_at_point(cx, cy, max_iters);
            row.push(escape_at);
        }
        rows.push(row);
    }
    rows
}

fn mandle_at_point(cx: f64, cy: f64, max_iters: usize) -> usize {
    // this is calculated for every character encountered
    let mut z = Complex::new(0.0, 0.0);
    let c = Complex::new(cx, cy); //representing the pixels as complex number
    for i in 0..=max_iters {
        if z.norm() > 2.0 {
            // if Euclidean Norm is greater than 2
            return i;
        }
        z = z * z + c;
    }
    max_iters
}
fn render_mandle(escape_vals: Vec<Vec<usize>>) {
    // I really can't spell
    for row in escape_vals {
        let mut line = String::with_capacity(row.len());
        for column in row {
            let val = match column {
                0..=2 => ' ',
                3..=5 => '.',
                6..=10 => '🐧',
                11..=30 => '*',
                31..=100 => '+',
                101..=200 => 'x',
                201..=400 => '$',
                401..=700 => '#',
                _ => '%',
            };
            line.push(val);
        }
        println!("{}", line);
    }
}
fn main() {
    let m = calc_mandle(10000, -2.0, 1.0, -1.0, 1.0, 200, 100);
    render_mandle(m);
    println!("Hello, TUX!🐧🐧🐧🐧🐧🐧🐧🐧🐧🐧🐧🐧🐧🐧");
}
```

> Bye🦀 
