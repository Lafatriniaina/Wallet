import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';

function createData(
    categorieName: string,
    mount: number,
    date: string,
    status: string,
    ) {
        return { categorieName, mount, date, status };
}

const rows = [
    createData('Frozen yoghurt', 159445210, "2 fev 2023", "Apprové"),
    createData('Ice cream sandwich', 42145245, "3 mar 2000", "En attente"),
    createData('Eclair', 45342872, "3 mar 2000", "Apprové"),
    createData('Cupcake', 30578582, "3 mar 2000", "livré"),
    createData('Gingerbread', 3557872587, "3 mar 2000", "Apprové"),
];

const makeStyles = (status: string) => {
    if (status === "Apprové") {
        return {
            background: '#66e99c',
            color: 'green',
        }; 
    } else if (status === "En attente") {
        return {
            background: '#ffadad8f',
            color: 'red',
        }; 
    } else {
        return {
            background: '#59bfff',
            color: 'white',
        }; 
    }
};


function TableListsDashboard() {
  return (
    <TableContainer component={Paper}>
        <Table sx={{ minWidth: 650 }} size="small" aria-label="a dense table" className="border-0">
            <TableHead className="h-[90px]">
                <TableRow>
                    <TableCell>Catégories</TableCell>
                    <TableCell align="left">Montants&nbsp;(MGA)</TableCell>
                    <TableCell align="left">Dates</TableCell>
                    <TableCell align="left">Status</TableCell>
                    <TableCell align="left"></TableCell>
                </TableRow>
            </TableHead>
            <TableBody>
                {rows.map((row) => (
                    <TableRow
                    key={row.categorieName}
                    sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
                    className="h-[60px]"
                    >
                    <TableCell component="th" scope="row">
                        {row.categorieName}
                    </TableCell>
                    <TableCell align="left">{row.mount}</TableCell>
                    <TableCell align="left">{row.date}</TableCell>
                    <TableCell align="left">
                        <span className="p-[10px] rounded-lg" style={makeStyles(row.status)}>{row.status}</span>
                    </TableCell>
                    <TableCell align="left">Details</TableCell>
                    </TableRow>
                ))}
            </TableBody>
        </Table>
    </TableContainer>
  )
}

export default TableListsDashboard;
