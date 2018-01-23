/*  This file is part of GestoSAT.
*
*    GestoSAT is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    GestoSAT is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU Affero General Public License
*    along with GestoSAT.  If not, see <http://www.gnu.org/licenses/>.
* 
*    Salvador Puertes Aleixandre, July 2016
*
*/

package GestoSAT;

public class MaterialTrabajos {
	private float cantidad;
	private Stock stock;

    public MaterialTrabajos(Stock stock, float cantidad){
        this.cantidad =Math.abs(cantidad);
        this.stock = stock;
    }
    
    public float getCantidad() {
        return cantidad;
    }

    public void setCantidad(float cantidad) {
        this.cantidad = Math.abs(cantidad);
    }
    
    public Stock getStock(){
        return this.stock;
    }
    
}
