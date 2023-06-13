import prisma from '../prismaClient.js'

const getDefensas_en_reinos = async (req, res) => {
    try {
        const defensas_en_reinos = await prisma.defensas_en_reinos.findMany()
        res.json(defensas_en_reinos)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener todos los registros de defensas en reino'})
    }
}

const getDefensa_en_reinoById = async (req, res) => {
    try {
        const { id_reino, id_defensa } = req.params
        const defensa_en_reino = await prisma.defensas_en_reinos.findFirst({
            where: { id_reino: Number(id_reino), id_defensa: Number(id_defensa) }
        })
        res.json(defensa_en_reino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener por id registro de defensa en reino'})
    }
}

const createDefensa_en_reino = async (req, res) => {
    try {
        const { id_reino, id_defensa, meses_de_uso } = req.body
        const newDefensa_en_reino = await prisma.defensas_en_reinos.create({
            data: { id_reino, id_defensa, meses_de_uso }
        })
        res.json(newDefensa_en_reino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al crear nuevo registro de defensa en reino'})
    }
}

const updateDefensa_en_reino = async (req, res) => {
    try {
        const { id_reino, id_defensa } = req.params
        const { meses_de_uso } = req.body
        const updatedDefensa_en_reino = await prisma.defensas_en_reinos.updateMany({
            where: { id_reino: Number(id_reino), id_defensa: Number(id_defensa) },
            data: { meses_de_uso },
        })
        res.json(updatedDefensa_en_reino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al actualizar registro de defensa en reino'})
    }
}

const deleteDefensa_en_reino = async (req, res) => {
    try {
        const { id_reino, id_defensa } = req.params
        const deletedDefensa_en_reino = await prisma.defensas_en_reinos.deleteMany({
            where: { id_reino: Number(id_reino), id_defensa: Number(id_defensa) },
        })
        res.json(deletedDefensa_en_reino)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al eliminar registro de defensa en reino'})
    }
}

const Defensas_en_reinosController = {
    getDefensas_en_reinos,
    getDefensa_en_reinoById,
    createDefensa_en_reino,
    updateDefensa_en_reino,
    deleteDefensa_en_reino
}

export default Defensas_en_reinosController