-- CreateEnum
CREATE TYPE "public"."StatusKaryawan" AS ENUM ('active', 'noactive');

-- CreateTable
CREATE TABLE "public"."karyawan" (
    "id" SERIAL NOT NULL,
    "username" VARCHAR(100) NOT NULL,
    "nama" VARCHAR(100) NOT NULL,
    "password" VARCHAR(100) NOT NULL,
    "status" "public"."StatusKaryawan" NOT NULL DEFAULT 'noactive',

    CONSTRAINT "karyawan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."jabatan" (
    "id" SERIAL NOT NULL,
    "namaJabatan" VARCHAR(100) NOT NULL,

    CONSTRAINT "jabatan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."jabatanKaryawan" (
    "karyawanId" INTEGER NOT NULL,
    "jabatanId" INTEGER NOT NULL,

    CONSTRAINT "jabatanKaryawan_pkey" PRIMARY KEY ("karyawanId","jabatanId")
);

-- CreateTable
CREATE TABLE "public"."peranAkses" (
    "id" SERIAL NOT NULL,
    "namaAkses" VARCHAR(100) NOT NULL,
    "parentId" INTEGER,

    CONSTRAINT "peranAkses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Jabatan_PeranAkses" (
    "jabatanId" INTEGER NOT NULL,
    "peranId" INTEGER NOT NULL,

    CONSTRAINT "Jabatan_PeranAkses_pkey" PRIMARY KEY ("jabatanId","peranId")
);

-- CreateIndex
CREATE UNIQUE INDEX "karyawan_username_key" ON "public"."karyawan"("username");

-- CreateIndex
CREATE UNIQUE INDEX "jabatan_namaJabatan_key" ON "public"."jabatan"("namaJabatan");

-- AddForeignKey
ALTER TABLE "public"."jabatanKaryawan" ADD CONSTRAINT "jabatanKaryawan_karyawanId_fkey" FOREIGN KEY ("karyawanId") REFERENCES "public"."karyawan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."jabatanKaryawan" ADD CONSTRAINT "jabatanKaryawan_jabatanId_fkey" FOREIGN KEY ("jabatanId") REFERENCES "public"."jabatan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."peranAkses" ADD CONSTRAINT "peranAkses_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "public"."peranAkses"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Jabatan_PeranAkses" ADD CONSTRAINT "Jabatan_PeranAkses_jabatanId_fkey" FOREIGN KEY ("jabatanId") REFERENCES "public"."jabatan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Jabatan_PeranAkses" ADD CONSTRAINT "Jabatan_PeranAkses_peranId_fkey" FOREIGN KEY ("peranId") REFERENCES "public"."peranAkses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
