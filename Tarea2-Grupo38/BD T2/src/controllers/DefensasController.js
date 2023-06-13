import prisma from '../prismaClient.js'

const getDefensas = async (req, res) => {
    try {
        const defensas = await prisma.defensas.findMany()
        res.json(defensas)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener todos los registros de defensas'})
    }
}

const getDefensaById = async (req, res) => {
    try {
        const { id } = req.params
        const defensa = await prisma.defensas.findUnique({
            where: { id: Number(id) }
        })
        res.json(defensa)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener defensa por id'})
    }
}

const createDefensa = async (req, res) => {
    try {
        const { id, defensa } = req.body
        const newDefensa = await prisma.defensas.create({
            data: { id, defensa }
        })
        res.json(newDefensa)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al crear nueva defensa'})
    }
}

const updateDefensa = async (req, res) => {
    try {
        const { id } = req.params
        const { defensa } = req.body
        const updatedDefensa = await prisma.defensas.update({
            where: { id: Number(id) },
            data: { defensa },
        })
        res.json(updatedDefensa)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al actualizar registro de defensa'})
    }
}

const deleteDefensa = async (req, res) => {
    try {
        const { id } = req.params
        const deletedDefensa = await prisma.defensas.delete({
            where: { id: Number(id) },
        })
        res.json(deletedDefensa)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al eliminar defensa: Entidad relacionada con 1 o mas entidades'})
    }
}

const DefensasController = {
    getDefensas,
    getDefensaById,
    createDefensa,
    updateDefensa,
    deleteDefensa
}

export default DefensasController